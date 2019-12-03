---程序入口
MovieConverter.py

1.安装ffmpeg
  

2 install module
  pymysql: import pymysql
  re: import re
  subprocess：import subprocess
  os: import os
  threading：import threading
3.视频目录
    file_path = 'data\\'
4.mysql配置
    MovieConverter.__main__:
    outputer = MysqlOutput(
            '192.168.1.36',  # mysql服务器地址
            3306,  # 端口号
            'lub',  # 用户名
            '123456',  # 密码
            'ssqx_lb'  # 数据库名称
        )
5.所需要的插件，以python为例，其获取方法是cmd命令，进入到【D:\docker】目录，执行命令：pip freeze > requirements.txt

docker run -it -v  /etc/localtime:/etc/localtime:ro -v /www/wwwroot/ssqx/docker/python/ssqx-py-test/data:/app/data -v /www/wwwroot/ssqx/docker/python/ssqx-py-test/config/config.yaml:/app/config/config.yaml -v /www/wwwroot/ssqx/docker/python/ssqx-py-test/CommonCraw.py:/app/CommonCraw.py -v /www/wwwroot/ssqx/docker/python/ssqx-py-test/CrawQingXiu.py:/app/CrawQingXiu.py   --name ssqx-py-v1 -m 512m   -d crawqingxiu:v1.0
