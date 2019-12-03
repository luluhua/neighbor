import gc
import json
import os
import pathlib
import threading
import time
import uuid

import pymysql
import yaml
from bs4 import BeautifulSoup

from CommonCraw import Outputer, UrlManager, HtmlDownloader, FileTool, CommonTool, ContentFormat, MyLogger


# 解析器
class HtmlParser(object):
    def __init__(self):
        self.commontool = CommonTool()

    def _del_yaowen(self, url, soup):
        new_urls = None
        new_datas = None
        sub_list = soup.find("ul", class_='sub_list')
        if sub_list is not None:
            new_urls = self._get_yaowen_urls(url, soup)
        else:
            classify_type = url.replace(root_url + 'yaowen/', '')
            new_datas = self._get_yaowen_data(url, soup)
            new_datas['classify_type'] = classify_type[0: classify_type.find('/')]
        return new_urls, new_datas

    def _get_yaowen_urls(self, pre_url, soup):
        # 获取页面中的新连接
        new_urls = set()
        page_box = soup.find("div", class_='page_box')
        if page_box is not None:
            nav_cont = soup.find("div", class_="nav1Cont")
            if nav_cont is not None:
                lis = nav_cont.find_all("li")
                for li in lis:
                    a = li.find("a")
                    if a is not None and "http" not in a['href']:
                        if a['href'].count("../") > 2:
                            new_urls.add(root_url + a['href'].replace("../", " ", a['href'].count("../")))
                        elif a['href'].count("./") == 1:
                            if pre_url.find(".html") > -1:
                                new_urls.add(a['href'].replace(".", pre_url[0: pre_url.rfind("/")], 1))
                            else:
                                new_urls.add(a['href'].replace("./", pre_url, 1))
            page_script = page_box.find("script").text
            if page_script is not None:
                page_script_text = page_script.replace("createPageHTML(", "").replace(', "index","html");', '')
                total_count = int(page_script_text[0: page_script_text.find(",")])
                page_count = int(page_script_text[page_script_text.find(",") + 1:len(page_script_text)])
                if page_count < total_count - 1:
                    count = str(page_count + 1)
                    if pre_url.find(".html") > -1:
                        url = pre_url[0: pre_url.rfind("/") + 1] + "index_" + count + ".html"
                    else:
                        url = pre_url + "index_" + count + ".html"
                    new_urls.add(url)
        else:
            ul = soup.find("ul", class_='sub_list')
            if ul is not None:
                lis = ul.find_all("li")
                for li in lis:
                    a = li.find("a")
                    if a is not None and "http" not in a['href']:
                        new_urls.add(a['href'].replace(".../", pre_url)
                                     .replace("../", pre_url)
                                     .replace("./", pre_url))
        return new_urls

    def _get_yaowen_data(self, pre_url, soup):
        obj = {}
        aticle_box = soup.find("div", class_="aticle_box")
        # 随机生成UUID
        obj["id"] = str(uuid.uuid4()).replace("-", "")

        obj['title'] = ""
        if aticle_box.find("h1") is not None:
            obj['title'] = aticle_box.find("h1").text
        aticle_info = aticle_box.find("div", class_='aticle_info')
        spans = aticle_info.find_all('span')
        obj["create_name"] = ""
        obj["goto_url"] = ""
        obj["dt_publish"] = ""
        if len(spans) > 2:
            text = spans[0].text
            obj["create_name"] = text[0:text.find("w")]
            obj["goto_url"] = text[text.find("w"):len(text)]
            obj["dt_publish"] = spans[1].text.replace("发布时间：", "") + ":00"
        elif len(spans) > 1:
            text = spans[0].text
            obj["dt_publish"] = text.replace("发布时间：", "") + ":00"

        content_zoom = aticle_box.find("div", id='zoom')
        ps = content_zoom.find_all("p")
        obj['article_content'] = ''
        if len(ps) > 0:
            article_content = str(content_zoom)
            for p in ps:
                strong = p.find('strong')
                if strong is not None:
                    article_content = article_content.replace(str(strong), '')
                    continue
                img = p.find('img')
                if img is not None:
                    repalce_str = str(p).replace("text-indent:", "")
                    article_content = article_content.replace(str(p), repalce_str)
                    continue
            replace_content = article_content.replace('src=".', 'src="' + pre_url[0:pre_url.rfind("/")]) \
                .replace('href=".', 'href="' + pre_url[0:pre_url.rfind("/")]) \
                .replace("font-size:", " ").replace("<img", "<img width='80%'").replace("width:", "") \
                .replace("line-height:", "").replace("<table", "<table style='border: 1px solid;'") \
                .replace("<td", "<td style='border: 1px solid;'") \
                .replace("background-color:", " ").replace("color:", "")
            obj['article_content'] = "<div style='font-size:small,letter-spacing:normal'>" + replace_content + "</div>"
        else:
            obj['article_content'] = str(content_zoom).replace("<img", "<img width='80%'").replace("width:", "") \
                .replace('src=".', 'src="' + pre_url[0:pre_url.rfind("/")])

        obj['source'] = ""
        obj['author'] = ""
        share_left_div = soup.find("div", class_="share_left")
        if share_left_div is not None:
            share_left = share_left_div.text
            obj['source'] = share_left[share_left.find("来源：") + 3:share_left.find("作者：")]
            obj['author'] = share_left[share_left.find("作者：") + 3:]
        obj['dt_create'] = self.commontool.get_now(None)
        article_images = content_zoom.find('img')
        obj['article_images'] = ''
        if article_images is not None and 'gif' not in article_images['src']:
            if "./" in article_images['src']:
                obj['article_images'] = article_images['src'].replace(".", pre_url[0:pre_url.rfind("/")], 1)
            else:
                obj['article_images'] = root_direc + article_images['src']
        return obj

    def parse(self, page_url, html_doc):
        if page_url is None or html_doc is None:
            return
        # 解析成了一个整个的DOM对象，也就是纯html格式的文件
        new_urls = None
        new_datas = None
        file_name = None
        if 'yaowen' in page_url:
            soup = BeautifulSoup(html_doc.text, "html.parser")
            new_urls, new_datas = self._del_yaowen(page_url, soup)
            file_name = 'article_detail'
        return new_urls, new_datas, file_name


# 输出器-mysql
class MysqlOutput(object):
    def __init__(self, host, port, user, passwd, dbname):
        self.host = host
        self.port = port
        self.user = user
        self.passwd = passwd
        self.dbname = dbname
        self.conn = None
        self.cursor = None
        self.filetool = FileTool()
        self.insert_article_sql = "insert ignore into t_cms_article(id,title,create_name,goto_url,dt_publish," \
                                  "article_content,source,author,dt_create,article_images,classify_id,program_id," \
                                  "article_status,is_deleted) " \
                                  "values(%s, %s, %s,%s,%s,%s,%s,%s, %s,%s,%s,%s,1, 0)"
        self.select_classify_id_sql = "SELECT id FROM t_cms_classify WHERE is_deleted=0 AND crt='zwgk' AND code=%s"
        self.select_program_id_sql = "SELECT id FROM t_cms_program WHERE is_deleted=0 and code='zwgk'"

    def connet_db(self):
        db = pymysql.connect(
            host=self.host,  # mysql服务器地址
            port=self.port,  # 端口号
            user=self.user,  # 用户名
            passwd=self.passwd,  # 密码
            db=self.dbname,  # 数据库名称
        )
        return db

    def insert_datas(self, rootdir):
        logger.info("开始执行数据导入")
        self.conn = self.connet_db()
        self.cursor = self.conn.cursor()
        files = self.filetool.list_all_files(rootdir)
        for file in files:
            if '.json' in file and "finish" not in file and 'craw_fail' not in file:
                with open(file, mode='r', encoding='utf-8') as s:
                    json_text = s.read()
                json_obj = json.loads(json_text)
                try:
                    if 'article_detail' in file:
                        self.insert_article(json_obj)
                        new_file = file.replace("article_detail", "article_detail_finish")
                        os.rename(file, new_file)
                except Exception as e:
                    self.conn.rollback()
                    logger.error("数据导入异常", exc_info=True)
                    continue
                finally:
                    self.conn.commit()
        self.conn.close()
        logger.info("数据导入完成")

    def insert_article(self, json_obj):
        logger.info("执行数据导入cms_article表：")
        datas = self.del_article_datas(json_obj)
        if len(datas) > 0:
            self.cursor.executemany(self.insert_article_sql, datas)
            logger.info("导入完成")
        else:
            logger.info("不存在需要导入的数据")

    def del_article_datas(self, json_obj):
        results = []
        for obj in json_obj:
            classify_type = obj["classify_type"]
            del obj['classify_type']
            self.cursor.execute(self.select_classify_id_sql, (classify_type,))
            classify_id = self.cursor.fetchone()
            if classify_id is not None:
                obj["classify_id"] = classify_id[0]
            else:
                obj["classify_id"] = 0
            if 'tzgg' == classify_type:
                obj['article_images'] = ''
            self.cursor.execute(self.select_program_id_sql)
            program_id = self.cursor.fetchone()
            if program_id is not None:
                obj["program_id"] = program_id[0]
            else:
                obj["program_id"] = 0
            results.append(tuple(obj.values()))
        return results


def print_time(thread_name):
    logger.info("%s: %s" % (thread_name, time.ctime(time.time())))


# 触发器-定时器
class MyTrigger(object):
    # 定时器1：
    @staticmethod
    def do_craw_trigger1(h=13, m=0):
        from datetime import datetime
        # 读取当时的系统时间
        cur_time = datetime.now()
        if cur_time.hour == h and cur_time.minute == m:
            return True
        else:
            return False

    # 定时器2：
    @staticmethod
    def do_craw_trigger2(h=1, m=0):
        from datetime import datetime
        # 读取当时的系统时间
        cur_time = datetime.now()
        if cur_time.hour == h and cur_time.minute == m:
            return True
        else:
            return False


# 主函数
class SpiderMain(object):
    def __init__(self, _dir):
        self.jsonoutputer = Outputer(_dir)
        self.urls = UrlManager()
        self.downloader = HtmlDownloader()
        self.parser = HtmlParser()
        self.filetool = FileTool()
        self.old_finish_url = self.filetool.read_file(root_direc + "old", "finish_url.txt")

    def deal_fail(self, rootdir):
        logger.info('开始检测是否存在未成功连接.....')
        files = self.filetool.list_all_files(rootdir)
        for file in files:
            if 'craw_fail' in file:
                with open(file, mode='r', encoding='utf-8') as s:
                    json_text = s.read()
                if json_text == '':
                    break
                json_obj = json.loads(json_text)
                logger.info('开始执行未成功连接.....')
                with open(file, mode='w', encoding='utf-8') as fout:
                    fout.write('')
                try:
                    for obj in json_obj:
                        if 'url' in obj and root_url + "index_1.html" not in obj['url']:
                            self.craw(obj['url'])
                except Exception as e:
                    logger.error('未成功连接回退:' + obj['url'], exc_info=True)
                    with open(file, mode='w', encoding='utf-8') as fout:
                        fout.write(json_text)
                # 递归执行失败项处理
                self.deal_fail(rootdir)
        logger.info('未成功连接处理完成.....')

    def craw(self, craw_url):
        errors = []
        finish_url = ""
        self.urls.add_new_url(craw_url)
        while self.urls.has_new_url():
            try:
                new_url = self.urls.get_new_url()
                if new_url + ',' in self.old_finish_url:
                    continue
                logger.info("正在采集：" + new_url)
                html_cont = self.downloader.download(new_url)
                new_urls, new_datas, file_name = self.parser.parse(new_url, html_cont)
                if new_urls is not None:
                    self.urls.add_new_urls(new_urls)
                    logger.info("链接采集完成！")
                elif new_datas is not None:
                    self.old_finish_url += new_url + ","
                    finish_url += new_url + ","
                    self.jsonoutputer.output_json(new_datas, file_name)
                    logger.info("数据采集完成！")
            except Exception as e:
                # 执行出错，则将该url放入出错
                logger.error("数据采集异常：" + new_url, exc_info=True)
                error_ = {'url': new_url, 'error': str(e)}
                errors.append(error_)
                continue
        if len(errors) > 0:
            self.jsonoutputer.output_json(errors, 'craw_fail')
        self.filetool.write_file(finish_url, root_direc + "old", "finish_url.txt")


# 线程
class MyThread(threading.Thread):  # 继承父类threading.Thread
    def __init__(self, name, types, url, dire):
        threading.Thread.__init__(self)
        self.name = name
        self.types = types
        self.url = url
        self.dir = dire

    def run(self):  # 把要执行的代码写到run函数里面 线程在创建后会直接运行run函数
        try:
            logger.info("Starting " + self.name)
            print_time(self.name)
            for t in self.types:
                spider.craw(self.url + t + "/")
            content_format.all_json_formate(root_direc)
            spider.deal_fail(self.dir + '/1_json/')
            outputer.insert_datas(root_direc)
            logger.info("Exiting " + self.name)
        except Exception as e:
            logger.error("执行异常", exc_info=True)


def init_config(default_path):
    path = default_path
    _config = []
    if os.path.exists(path):
        with open(path, 'r', encoding='utf-8') as f:
            _config = yaml.safe_load(f)
    return _config


def init(config_dict):
    # 初始化文件
    # info.log
    log_folder = config_dict['log_directory']
    pathlib.Path(log_folder).mkdir(parents=True, exist_ok=True)


root_url = 'http://www.qingxiu.gov.cn/'  # 主入口
root_type = ['yaowen']  # 模块
config_path = "config/config.yaml"
exitFlag = False
if __name__ == '__main__':
    config = init_config(config_path)
    init(config)
    root_direc = config['data_directory']
    logger = MyLogger(config).get_logger()
    logger.info("启动数据挖掘程序......")
    common = CommonTool()
    content_format = ContentFormat()
    trigger = MyTrigger()
    outputer = MysqlOutput(
        '192.168.1.36',  # mysql服务器地址
        3306,  # 端口号
        'lub',  # 用户名
        '123456',  # 密码
        'ssqx_main'  # 数据库名称
    )
    # outputer = MysqlOutput(
    #     '127.0.0.1',  # mysql服务器地址
    #     3306,  # 端口号
    #     'root',  # 用户名
    #     'dc7f07160df6226c',  # 密码
    #     'ssqx_main'  # 数据库名称
    # )
    while True:
        try:
            logger.info("检测定时器是否到时")
            if not exitFlag or trigger.do_craw_trigger1() or trigger.do_craw_trigger2():
                data_dir = root_direc + common.get_now('%Y%m%d%H%M%S')
                spider = SpiderMain(data_dir)
                logger.info("开始执行数据挖掘")
                # 创建线程--用于执行数据爬取
                thread = MyThread("Thread-1", root_type, root_url, data_dir)
                # 开启线程
                thread.start()
                exitFlag = True
            # 等待爬取线程执行完成后，重启定时器
            if exitFlag and thread.isAlive():
                # 线程阻塞
                thread.join()
            # 休眠一分钟
            time.sleep(60)
        except Exception as e:
            logger.error("执行异常", exc_info=True)
            continue
        finally:
            gc.collect()
