package com.weiyu.controller;

import com.weiyu.dao.RoleDao;
import com.weiyu.dao.UserDao;
import com.weiyu.domain.Role;
import com.weiyu.domain.User;
import com.weiyu.domain.UserRole;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:12.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class RoleControllerTest {

    @Resource
    private RoleDao roleDao;

    @Resource
    private UserDao userDao;

    @Test
    public void roleSave() {
        Role role = new Role();
        role.setName("Administrator0");
        roleDao.addRole(role);
    }
//    @Test
//    public void addUser(){
//        User user = new User();
//        user.setUsername("demo01");
//        user.setPassword("123");
//        user.setEmail("admin@qq.com");
//        userDao.addUser(user);
//        userDao.addUserRole(new UserRole(user.getId(), (long) 4));
//    }


}
