---程序入口
CrawQingXiu.py

1 install module
    pymysql:pip install pymysql
    bs4 :pip install bs4
    requests :pip install requests
    yaml:pip install pyyaml
2.数据保存目录
    root_direc = 'data\\'
3.mysql配置
    CrawQingXiu.__main__:
    outputer = MysqlOutput(
            '192.168.1.36',  # mysql服务器地址
            3306,  # 端口号
            'lub',  # 用户名
            '123456',  # 密码
            'ssqx_lb'  # 数据库名称
        )