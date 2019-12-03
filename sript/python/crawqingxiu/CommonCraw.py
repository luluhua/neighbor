# 简单的下载器
import datetime
import json
import logging.config
import os
import pathlib

import requests

logger = logging.getLogger()


class HtmlDownloader(object):
    @staticmethod
    def download(url):
        if url is None:
            return None
        try:
            s = requests.session()
            s.keep_alive = False  # 关闭多余连接
            headers = {
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3',
                'Accept-Encoding': 'gzip, deflate',
                'Accept-Language': 'zh-CN,zh;q=0.9',
                'Cache-Control': 'no-cache',
                'Connection': 'keep-alive',
                'Host': 'www.qingxiu.gov.cn',
                'Pragma': 'no-cache',
                'Upgrade-Insecure-Requests': '1',
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
            }
            res = requests.get(url, headers=headers, timeout=3)
            res.encoding = 'utf-8'
            if res.status_code != 200:
                return None
            return res
        except Exception:
            logger.error("连接请求失败！", exc_info=True)
        finally:
            res.close()
            del (res)


# url管理器
class UrlManager(object):
    """
    url管理器主要有三个功能：add_new_url添加新的待爬取的页面；get_new_url删除已爬取的页面；标记待爬取的和已爬取的页面。
    """

    def __init__(self):
        self.new_urls = set()
        self.old_urls = set()

    def add_new_url(self, url):
        if url is None:
            return
            # 如果传入的url既不在待爬取的url里又不在爬过的url里，说明它是待爬取的url
        if url not in self.new_urls and url not in self.old_urls:
            self.new_urls.add(url.replace(" ", ""))

    def add_new_urls(self, urls):
        if urls is None or len(urls) == 0:
            return
        for url in urls:
            self.add_new_url(url)

    def has_new_url(self):
        return len(self.new_urls) > 0

    def get_new_url(self):
        new_url = self.new_urls.pop()  # 从待爬去的url中剔除要爬取的目标
        self.old_urls.add(new_url)  # 添加到
        return new_url


# 文件工作器
class FileTool(object):
    def list_all_files(self, rootdir):
        _files = []
        try:
            _list = os.listdir(rootdir)  # 列出文件夹下所有的目录与文件
        except FileNotFoundError:
            return _files
        for i in range(0, len(_list)):
            path = os.path.join(rootdir, _list[i])
            if os.path.isdir(path):
                _files.extend(self.list_all_files(path))
            if os.path.isfile(path):
                _files.append(path)
        return _files

    @staticmethod
    def write_file(datas, folder, file_name):
        if file_name is None or datas is None:
            return
        if folder is not None:
            pathlib.Path(folder + "\\").mkdir(parents=True, exist_ok=True)
            with open(folder + "\\" + file_name, 'a', encoding="UTF-8") as fout:
                fout.write(datas + ",")
        else:
            with open(file_name, 'a', encoding="UTF-8") as fout:
                fout.write(datas + ",")

    def read_file(self, folder, file_name):
        json_text = ""
        try:
            with open(folder + "\\" + file_name, mode='r', encoding='utf-8') as s:
                json_text = s.read()
        except FileNotFoundError as e:
            self.write_file("", folder, file_name)
        return json_text

    # 将文件复制到项目文件夹
    @staticmethod
    def transfer_file(srcfile, dstfile):
        import shutil
        if not os.path.isfile(srcfile):
            logger.info("%s not exist!" % srcfile)
            return None
        else:
            fpath, fname = os.path.split(srcfile)  # 分离文件名和路径
            if not os.path.exists(dstfile):
                os.makedirs(dstfile)  # 创建路径
            shutil.move(srcfile, dstfile)  # 移动文件
            logger.info("copy %s -> %s" % (srcfile, dstfile))
            return os.path.join(dstfile, fname)


# 常用工具
class CommonTool(object):
    def __init__(self):
        self.all_time_formate = "%Y-%m-%d %H:%M:%S"
        self.time_formate = '%Y-%m-%d %H:%M'

    # 获取当前时间
    def get_now(self, time_formate):
        if time_formate is not None:
            dt = datetime.datetime.now().strftime(time_formate)
        else:
            dt = datetime.datetime.now().strftime(self.all_time_formate)
        return dt

    # 字符串转时间
    @staticmethod
    def string_to_time(detester, time_formate):
        date = datetime.datetime.strptime(detester, time_formate)
        return date

    @staticmethod
    def date_to_string(date, time_formate):
        detester = date.strftime(time_formate)
        return detester


# 文件格式化
class ContentFormat(object):
    def __init__(self):
        self.file_tool = FileTool()

    @staticmethod
    def json_format(file_name):
        try:
            if file_name is None:
                return
            if os.path.exists(file_name):
                with open(file_name, mode='r', encoding='utf-8') as s:
                    json_text = s.read()
                if json_text == '':
                    return
                _text = json_text
                with open(file_name, mode='w', encoding='utf-8') as fout:
                    new_json_text = _text.replace('][', ',').replace(',,,', ',').replace(',,', ',').replace(',]', ']') \
                        .replace("[[", "[").replace("]]", ']')
                    fout.write(new_json_text)
        except Exception as e:
            logging.info(file_name, e)

    def json_formate(self, _folder_path):
        for cdir, subdirs, files in os.walk(_folder_path):
            for file in files:
                if file.endswith(".json"):
                    self.json_format(file)

    def all_json_formate(self, _folder_path):
        logger.info("开始执行数据格式化！")
        files = self.file_tool.list_all_files(_folder_path)
        for file in files:
            if file.endswith(".json"):
                self.json_format(file)
        logger.info("数据格式化完成！")


# 输出器
class Outputer(object):
    def __init__(self, folder_path):
        self.folder = folder_path
        self.json_folder = folder_path + '\\1_json\\'
        self.html_folder = folder_path + '\\2_html\\'
        self.file_folder = folder_path + '\\3_file\\'

    def output_txt(self, datas, file_name):
        if file_name is None or datas is None:
            return
        pathlib.Path(self.json_folder).mkdir(parents=True, exist_ok=True)
        with open(self.json_folder + file_name + ".txt", 'a', encoding="UTF-8") as fout:
            fout.write("[" + json.dumps(datas, ensure_ascii=False, indent=4) + "]")

    def output_json(self, datas, file_name):
        if file_name is None or datas is None:
            return
        pathlib.Path(self.json_folder).mkdir(parents=True, exist_ok=True)
        with open(self.json_folder + file_name + ".json", 'a', encoding="UTF-8") as fout:
            fout.write("[" + json.dumps(datas, ensure_ascii=False, indent=4) + "]")

    def output_fail_json(self, datas, file_name):
        if file_name is None or datas is None:
            return
        pathlib.Path(self.json_folder).mkdir(parents=True, exist_ok=True)
        with open(self.json_folder + file_name + ".json", 'w', encoding="UTF-8") as fout:
            fout.write(json.dumps(datas, ensure_ascii=False))

    def output_html(self, _html, file_name):
        if file_name is None and _html is None:
            return
        pathlib.Path(self.html_folder).mkdir(parents=True, exist_ok=True)
        with open("template.html", "r", encoding="UTF-8") as file_object:
            all_the_text = file_object.read()
        with open(self.html_folder + file_name + ".html", 'w', encoding="UTF-8") as fout:
            _replace_html = all_the_text.replace("%_html_%", _html)
            fout.write(_replace_html.replace('&#13;', ''))


class MyLogger(object):
    def __init__(self, config_dict=None, default_level=logging.INFO):
        if config_dict is not None:
            config_str = str(config_dict)
            replace_str = config_str.replace("${log_directory}", config_dict['log_directory'])
            logging.config.dictConfig(eval(replace_str))
        else:
            logging.basicConfig(level=default_level)

    @staticmethod
    def get_logger():
        return logging.getLogger()
