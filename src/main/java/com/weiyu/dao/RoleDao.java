package com.weiyu.dao;

import com.weiyu.domain.Role;
import com.weiyu.domain.RolePermission;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午8:19.
 */
public interface RoleDao {

    Role findById(Long id);

    List<RolePermission> findByRolePermission(Long id);

    void addRole(Role role);

    List<Role> findRoles();

    void deleteRole(Long id);

    void addRolePermission(RolePermission rolePermission);

    void updateRole(Role role);

    void updateRolePermission(RolePermission rolePermission);

    void deleteRolePermission(Long id);

}
