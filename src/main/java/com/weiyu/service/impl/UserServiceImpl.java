package com.weiyu.service.impl;

import com.weiyu.dao.UserDao;
import com.weiyu.domain.User;
import com.weiyu.domain.UserIdRole;
import com.weiyu.domain.UserRole;
import com.weiyu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author zhouyulong
 * @date 2018/10/11 下午2:56.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> selectUser(){
        return userDao.selectUser();
    }

    @Override
    public User selectByUserName(String username) {
        return userDao.selectByUserName(username);
    }

    @Override
    public void addUser(User user, Long... roleIds){
        userDao.addUser(user);
        if (roleIds !=null && roleIds.length>0) {
            for (Long roleId: roleIds) {
                userDao.addUserRole(new UserRole(user.getId(),roleId));
            }

        }
    }
    @Override
    public void addUserRole(User user, Long... roleIds){
        userDao.updateUser(user);
        if (roleIds !=null && roleIds.length>0) {
            for (Long roleId: roleIds) {
                userDao.addUserRole(new UserRole(user.getId(),roleId));
            }
        }
    }
    @Override
    public void deleteUser(Long userId){
        userDao.deleteUserRole(userId);
        userDao.deleteUser(userId);
    }

    @Override
    public void updateUser(User user){
        userDao.updateUser(user);
    }

    @Override
    public void updateUserRoles(User user, Long urId, Long... roleIds){
             userDao.updateUser(user);
            if (roleIds !=null && roleIds.length>0) {
                for (Long roleId: roleIds) {
                    System.out.println("--------角色id: "+roleId+"-----------用户ID: "+user.getId()+"------------用户角色ID: "+urId);
                    UserRole userRole = new UserRole();
                    userRole.setId(urId);
                    userRole.setUserId(user.getId());
                    userRole.setRoleId(roleId);
                    userDao.updateUserRole(userRole);
                }

            }
        }


    @Override
    public UserIdRole findById(Long id) {
        return userDao.findById(id);
    }
    @Override
    public UserIdRole findByUserRole(Long id) {
        return userDao.findByUserRole(id);
    }

    @Override
    public UserRole findByUserRolesId(Long userId) {
        return userDao.findByUserRolesId(userId);
    }

    @Override
    public Set<String> findByRoles(String username){
        return new HashSet<String>(userDao.findByRoles(username));
    }

    @Override
    public Set<String> findByPermissions(String username){
        return new HashSet<String>(userDao.findPermissions(username));
    }
}
