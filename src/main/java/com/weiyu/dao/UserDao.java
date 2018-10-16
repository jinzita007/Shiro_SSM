package com.weiyu.dao;

import com.weiyu.domain.User;
import com.weiyu.domain.UserIdRole;
import com.weiyu.domain.UserRole;

import java.util.List;
import java.util.Set;

/**
 * @author zhouyulong
 * @date 2018/10/11 下午2:55.
 */
public interface UserDao {
    List<User> selectUser();

    User selectByUserName(String username);

    void addUser(User user);

    void addUserRole(UserRole userRole);

    void updateUser(User user);

    void updateUserRole(UserRole userRole);

    UserRole findByUserRolesId(Long UserId);

    void deleteUser(Long userId);

    void deleteUserRole(Long userId);

    UserIdRole findById(Long id);

    UserIdRole findByUserRole(Long id);

    Set<String> findByRoles(String username);

    Set<String> findPermissions(String username);

}
