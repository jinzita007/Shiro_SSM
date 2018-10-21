package com.weiyu.controller;

import com.weiyu.dao.RoleDao;
import com.weiyu.dao.UserDao;
import com.weiyu.domain.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

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
    @Test
    public void addRole() {
        String str = "小学,初中,高中,大专,本科,研究生,博士";
        String[] buff = str.split(",");
        for(int i=0;i<buff.length;i++){
            System.out.println(buff[i]);
        }
    }
    @Test
    public void findByRolePerm() {
        long id =new Long(1).intValue();
        List<RolePermission> roleIdPermission = roleDao.findByRolePermission(id);
        System.out.println("----------"+roleIdPermission);
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
