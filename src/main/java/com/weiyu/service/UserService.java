package com.weiyu.service;

import com.weiyu.domain.User;
import com.weiyu.domain.UserIdRole;
import com.weiyu.domain.UserRole;

import java.util.List;
import java.util.Set;

/**
 * @author zhouyulong
 * @date 2018/10/11 下午2:55.
 */
public interface UserService {

    /**
     * 查询所有用户信息
     * @return
     */
    List<User> selectUser();

    /**
     * 通过用户名查找用户
     * @param username
     * @return
     */
    User selectByUserName(String username);

    /**
     * 新增用户
     * @param user
     * @return
     */
    void addUser(User user, Long... roleIds);

    void addUserRole(User user, Long... roleIds);

    void updateUser(User user);

    /**
     * 更新用户和用户角色
     * @param roleIds
     */
    void updateUserRoles(User user, Long urId, Long... roleIds);


    /**
     * 删除用户
     * @param userId
     */
    void deleteUser(Long userId);

    /**
     * 根据用户名查找用户ID
     * @param id
     * @return
     */
    UserIdRole findById(Long id);

    UserIdRole findByUserRole(Long id);

    UserRole findByUserRolesId(Long userId);

    /**
     * 根据用户名查找角色
     * @param username
     * @return
     */
    Set<String> findByRoles(String username);

    /**
     * 根据用户名查找权限
     * @param username
     * @return
     */
    Set<String> findByPermissions(String username);

}
