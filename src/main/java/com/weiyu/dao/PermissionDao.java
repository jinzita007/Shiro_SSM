package com.weiyu.dao;

import com.weiyu.domain.Permission;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午8:20.
 */
public interface PermissionDao {

    List<Permission> findAllPermission();
    void addPermission(Permission permission);

}
