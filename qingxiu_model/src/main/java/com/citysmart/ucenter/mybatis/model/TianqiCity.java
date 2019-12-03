package com.citysmart.ucenter.mybatis.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 天气城市表
 * </p>
 *
 * @author lub
 * @since 2019-04-03
 */
@TableName("tianqi_city")
public class TianqiCity extends Model<TianqiCity> {

    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.INPUT)
    private  String id;
    private String cityEn;
    private String cityZh;
    private String provinceEn;
    private String provinceZh;
    private String countryEn;
    private String countryZh;
    private String leaderEn;
    private String leaderZh;
    private String lat;
    private String lng;

    @TableField(exist = false)
    private  String distance;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCityEn() {
        return cityEn;
    }

    public void setCityEn(String cityEn) {
        this.cityEn = cityEn;
    }

    public String getCityZh() {
        return cityZh;
    }

    public void setCityZh(String cityZh) {
        this.cityZh = cityZh;
    }

    public String getProvinceEn() {
        return provinceEn;
    }

    public void setProvinceEn(String provinceEn) {
        this.provinceEn = provinceEn;
    }

    public String getProvinceZh() {
        return provinceZh;
    }

    public void setProvinceZh(String provinceZh) {
        this.provinceZh = provinceZh;
    }

    public String getCountryEn() {
        return countryEn;
    }

    public void setCountryEn(String countryEn) {
        this.countryEn = countryEn;
    }

    public String getCountryZh() {
        return countryZh;
    }

    public void setCountryZh(String countryZh) {
        this.countryZh = countryZh;
    }

    public String getLeaderEn() {
        return leaderEn;
    }

    public void setLeaderEn(String leaderEn) {
        this.leaderEn = leaderEn;
    }

    public String getLeaderZh() {
        return leaderZh;
    }

    public void setLeaderZh(String leaderZh) {
        this.leaderZh = leaderZh;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "TianqiCity{" +
        "cityEn=" + cityEn +
        ", cityZh=" + cityZh +
        ", provinceEn=" + provinceEn +
        ", provinceZh=" + provinceZh +
        ", countryEn=" + countryEn +
        ", countryZh=" + countryZh +
        ", leaderEn=" + leaderEn +
        ", leaderZh=" + leaderZh +
        ", lat=" + lat +
        "}";
    }
}
