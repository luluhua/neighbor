**简介**
=========
dcsj_common 是多重世界java开发组内部工具
----------------------------

更新记录<br/>
----------------------------
###0.0.1
#####2019-08-23  liuguicheng <br/>
1. 引入 Hutool 工具包<br/>
    官方网址：https://www.hutool.cn <br/>
    包含组件一个Java基础工具类，对文件、流、加密解密、转码、正则、线程、XML等JDK方法进行封装，组成各种Util工具类，同时提供以下组件：<br/>
    * hutool-aop JDK动态代理封装，提供非IOC下的切面支持<br/>
    * hutool-bloomFilter 布隆过滤，提供一些Hash算法的布隆过滤<br/>
    * hutool-cache 简单缓存实现<br/>
    * hutool-core 核心，包括Bean操作、日期、各种Util等<br/>
    * hutool-cron 定时任务模块，提供类Crontab表达式的定时任务<br/>
    * hutool-crypto 加密解密模块，提供对称、非对称和摘要算法封装<br/>
    * hutool-db JDBC封装后的数据操作，基于ActiveRecord思想<br/>
    * hutool-dfa 基于DFA模型的多关键字查找<br/>
    * hutool-extra 扩展模块，对第三方封装（模板引擎、邮件、Servlet、二维码、Emoji、FTP、分词等）<br/>
    * hutool-http 基于HttpUrlConnection的Http客户端封装<br/>
    * hutool-log 自动识别日志实现的日志门面<br/>
    * hutool-script 脚本执行封装，例如Javascript<br/>
    * hutool-setting 功能更强大的Setting配置文件和Properties封装<br/>
    * hutool-system 系统参数调用封装（JVM信息等）<br/>
    * hutool-json JSON实现<br/>
    * hutool-captcha 图片验证码实现<br/>
    * hutool-poi 针对POI中Excel的封装<br/>
    * hutool-socket 基于Java的NIO和AIO的Socket封装<br/>
    可以根据需求对每个模块单独引入，也可以通过引入hutool-all方式引入所有模块。<br/>
2. 删除不必要工具（重复工具、效率低下工具）如下：<br/>
    * 去除UUIDGenerator 类，原因hutool重复，具体使用查看如下：<br/>
    https://www.hutool.cn/docs/#/core/%E5%B7%A5%E5%85%B7%E7%B1%BB/%E5%94%AF%E4%B8%80ID%E5%B7%A5%E5%85%B7-IdUtil
    
#
