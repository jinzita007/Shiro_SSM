package com.weiyu.service;

import com.weiyu.domain.Role;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:07.
 */
public interface RoleService {
    /**
     * 增加角色
     * @param role
     */
    void addRole(Role role);

    List<Role> findRoles();

}
