# 将非MP4视频转换为.mp4格式视频
import os
import re
import subprocess
import threading
import time

import pymysql


# 触发器-定时器
class MyTrigger(object):
    # 定时器1：
    @staticmethod
    def do_craw_trigger1(h=0, m=0):
        from datetime import datetime
        # 读取当时的系统时间
        cur_time = datetime.now()
        if cur_time.hour == h and cur_time.minute == m:
            return True
        else:
            return False


def getFilesPath(path):
    # 获得指定目录中的内容
    file_list = os.listdir(path)
    for file_name in file_list:
        new_path = os.path.join(path, file_name)
        if os.path.isdir(new_path):
            getFilesPath(new_path)
        elif os.path.isfile(new_path):
            # 文件处理
            result = re.match(
                r".+\.(avi|AVI|mpeg|MPEG|mov|MOV|flv|FLV|mpg|MPG|f4v|F4V|rmvb|RMVB|mkv|MKV|ogg|OGG|asf|ASF|3gp|3GP|m4a|M4A)$",
                new_path)
            if result:
                gl_file_list.append(new_path)
        else:
            print("It's not a directory or a file.")


def fileProcessing(file_list):
    print("start----------------")
    code_pre = "ffmpeg -threads 2 -i "
    code_mid = " -vcodec libx264 -acodec aac "
    for p in file_list:
        subname = p.split('.')
        print(subname)
        output_path = subname[0] + ".mp4"  # 处理后的文件路径
        command = code_pre + p + code_mid + output_path
        file_name = os.path.basename(p).split('.')
        try:
            retcode = subprocess.call(command, shell=True)
            if retcode == 0:
                os.remove(p)
                gl_successed_list.append(p.replace(file_path, "").replace("\\", "/"))
                print(file_name[0], "successed------")
            else:
                gl_failed_list.append(p)
                print(file_name[0], "is failed--------")
        except Exception as e:
            print("Error:", e)
            print("failed:", gl_failed_list)


# 输出器-mysql
class MysqlOutput(object):
    def __init__(self, host, port, user, passwd, dbname):
        self.conn = pymysql.connect(
            host=host,  # mysql服务器地址
            port=port,  # 端口号
            user=user,  # 用户名
            passwd=passwd,  # 密码
            db=dbname,  # 数据库名称
        )
        self.cursor = self.conn.cursor()

    def update(self, datas):
        try:
            self.updateMovie(datas['movies'])
        except Exception as err:
            self.conn.rollback()
            print(err)
        finally:
            self.conn.commit()
            self.conn.close()

    def updateMovie(self, movies):
        if len(movies) <= 0:
            return
        update_sql = 'UPDATE t_act_activity_enroll set work_path=%s where work_path=%s'
        results = []
        for p in movies:
            subname = p.split('.')
            output_path = subname[0] + ".mp4"  # 处理后的文件路径
            results.append((output_path, p))
        if len(results) > 0:
            self.cursor.executemany(update_sql, results)


# 线程
class MyThread(threading.Thread):  # 继承父类threading.Thread
    def __init__(self):
        threading.Thread.__init__(self)

    def run(self):  # 把要执行的代码写到run函数里面 线程在创建后会直接运行run函数
        try:
            getFilesPath(file_path)
            fileProcessing(gl_file_list)
            updata_datas['movies'] = gl_successed_list
            outputer.update(updata_datas)
        except Exception as err1:
            print(err1)


if __name__ == '__main__':
    file_path = 'E:/qingxiu_ucenter/file'  # 视频文件存放位置
    outputer = MysqlOutput(
        '192.168.1.27',  # mysql服务器地址
        3306,  # 端口号
        'admin',  # 用户名
        'admin123456',  # 密码
        'qingxiu_ucenter'  # 数据库名称
    )
    trigger = MyTrigger()
    updata_datas = {}
    while True:
        try:
            gl_file_list = []
            gl_failed_list = []
            gl_successed_list = []
            # 创建线程--用于执行数据爬取
            thread = MyThread()
            # 开启线程
            thread.start()
            # 等待爬取线程执行完成后，重启定时器
            if thread.isAlive():
                # 线程阻塞
                thread.join()
            # 休眠一分钟
            time.sleep(60 * 5)
        except Exception as e:
            print(e)
            continue
