package com.citysmart.ucenter.common.util;

import org.apache.commons.lang.StringUtils;

import java.util.Set;

public class RedisUtil {
    public static JedisUtil jedisUtil;
    /**
     * 项目redis 主包名
     */
    public static String QINGXIU_PACKAGE_KEY;
    /**
     * 缓存时间->默认一年
     */
    public static final int expire = 31536000;

    static {
        jedisUtil = JedisUtil.getInstance();
        QINGXIU_PACKAGE_KEY = SysSettingUtil.getRedisPackageKey();
    }


    /**
     * 根据key获取缓存值
     *
     * @param key
     * @return 缓存值
     */
    public static String getValueByKey(String key) {
        String value = jedisUtil.new Strings().get(QINGXIU_PACKAGE_KEY + ":" + key);
        if (StringUtils.isBlank(value)) {
            value = SysSettingUtil.getValueByKey(key);
            if (StringUtils.isBlank(value)) {
                return null;
            }
            setKeyValue(key, value);
        }
        return value;
    }

    /**
     * 根据 key 获取具体redis包下的的缓存值
     *
     * @param packageKey packageKey redis 包名
     * @param key        存入key名称
     * @return 缓存值
     */
    public static String getValueByPackageKey(String packageKey, String key) {
        String value = jedisUtil.new Strings().get(QINGXIU_PACKAGE_KEY +"."+ packageKey + ":" + key);
        if (StringUtils.isBlank(value)) {
            value = SysSettingUtil.getValueByKey(key);
            if (StringUtils.isBlank(value)) {
                return null;
            }
            setPackageKeyValue(packageKey, key, value);

        }
        return value;
    }

    /**
     * 封装 redis key
     *
     * @param packageKey redis 包名
     * @param key        存入key名称
     * @return redis key名称
     */
    public static String setPackageKey(String packageKey, String key) {
        String userRedispackagekey = QINGXIU_PACKAGE_KEY + "." + packageKey + ":" + key;
        return userRedispackagekey;
    }

    /**
     * 添加 reids  缓存
     *
     * @param key
     * @param value
     */
    public static void setKeyValue(String key, String value) {
        jedisUtil.new Strings().setEx(QINGXIU_PACKAGE_KEY + ":" + key, expire, value);
    }
    /**
     * 添加 reids  缓存
     *
     * @param key
     * @param value
     */
    public static void setKeyValue(String key, String value,int _expire) {
        jedisUtil.new Strings().setEx(QINGXIU_PACKAGE_KEY + ":" + key, _expire, value);
    }
    /**
     * 添加 指定包下 缓存
     *
     * @param packageKey
     * @param key
     * @param value
     */
    public static void setPackageKeyValue(String packageKey, String key, String value) {
        String userRedispackagekey = setPackageKey(packageKey, key);
        jedisUtil.new Strings().setEx(userRedispackagekey, expire, value);
    }

    /**
     * 删除key
     *
     * @param
     */
    public static void delKey(String key) {
        jedisUtil.new Keys().del(QINGXIU_PACKAGE_KEY + ":" + key);
    }

    /**
     * 删除指定包下key
     *
     * @param packageKey 包名
     * @param key        名
     */
    public static void delPackageKey(String packageKey, String key) {
        jedisUtil.new Keys().del(QINGXIU_PACKAGE_KEY + "." + packageKey + ":" + key);
    }

    /**
     * 清空所有
     */
    public static void delAll() {
        jedisUtil.new Keys().flushAll();
    }

    public static void dellAllByPackagenName(String packageName){
        Set<String> keys=jedisUtil.new Keys().keys(packageName+":**");
        String str= StringUtils.join(keys , ",");
        jedisUtil.new Keys().del(str);
    }


    public static long getIncr(String key,Integer count){
       return jedisUtil.new Strings().incrBy(QINGXIU_PACKAGE_KEY + ":" + key,count);
    }

    /***
     * @Author liuguicheng
     * @Description //TODO 分布式加锁
     * @Date 18:23 2019/8/21
     **/
    public static boolean tryGetDistributedLock(String lockKey, String requestId, int expireTime) {
       return jedisUtil.new RedisLock().tryGetDistributedLock(lockKey,requestId,expireTime);
    }
    /***
     * @Author liuguicheng
     * @Description //TODO 分布式解锁
     * @Date 18:23 2019/8/21
     **/
    public static boolean releaseDistributedLock(String lockKey, String requestId) {
        return jedisUtil.new RedisLock().releaseDistributedLock(lockKey,requestId);
    }

    /**
     * 添加 reids  缓存
     *
     * @param key
     * @param value
     */
    public static void setKeyValueByExpires(String key, String value, Integer expires) {
        jedisUtil.new Strings().setEx(QINGXIU_PACKAGE_KEY + ":" + key, expires, value);
    }
}
