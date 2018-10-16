package com.weiyu.dao;

import com.weiyu.domain.Role;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午8:19.
 */
public interface RoleDao {

    void addRole(Role role);

    List<Role> findRoles();
}
