package com.weiyu.service;

import com.weiyu.domain.Permission;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/16 下午1:36.
 */
public interface PermissionService {
    /**
     * 查询所有权限信息
     * @return
     */
    List<Permission> findAllPermission();

    /**
     * 新增权限
     * @param permission
     */
    void addPermission(Permission permission);

}
