package com.weiyu.domain;

import java.io.Serializable;

/**
 * @author zhouyulong
 * @date 2018/10/14 下午8:16.
 */
public class UserIdRole implements Serializable {
    private Long id;
    private Long urId;
    private Long role_id;
    private String username;
    private String email;
    private String password;
    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUrId() {
        return urId;
    }

    public void setUrId(Long urId) {
        this.urId = urId;
    }

    public Long getRole_id() {
        return role_id;
    }

    public void setRole_id(Long role_id) {
        this.role_id = role_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
