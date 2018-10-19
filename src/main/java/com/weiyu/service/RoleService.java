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
     * 根据角色权限查询权限ID
     * @param id
     */
    List<RolePermission> findByRolePermission(Long id);

    /**
     * 根据角色查询ID
     * @param id
     * @return
     */
    Role findById(Long id);

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

    /**
     * 更新角色权限关联
     * @param role
     * @param permissionIds
     */
    void updateRole(Role role, Long... permissionIds);

//    void addRolePermissions(Long id, Long... permissionIds);

}
