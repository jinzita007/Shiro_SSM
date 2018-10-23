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
     * 根据权限查询权限ID
     * @param id
     * @return
     */
    Permission findOne(Long id);

    /**
     * 新增权限
     * @param permission
     */
    void addPermission(Permission permission);

    /**
     * 更新权限
     * @param permission
     */
    void updatePermission(Permission permission);

    /**
     * 删除权限
     * @param id
     */
    void deletePermission(Long id);

}
