package com.weiyu.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/12 下午4:34.
 */
public class Permission {

    private Integer id;
    private String name;
    private String url;
    private Integer pid;
    private String code;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
