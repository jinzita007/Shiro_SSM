package com.weiyu.service;

import com.weiyu.domain.Role;
import com.weiyu.domain.RolePermission;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:07.
 */
public interface RoleService {

    /**
     * 查询所有角色
     * @return
     */
    List<Role> findRoles();

    /**
     * 删除角色
     * @param id
     */
    void deleteRole(Long id);

    /**
     * 增加角色权限关联
     * @param role
     */
    void addRole(Role role, Long... permissionIds);

}
