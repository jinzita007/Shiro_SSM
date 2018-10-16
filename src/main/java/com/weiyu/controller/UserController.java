package com.weiyu.controller;

import com.weiyu.dao.UserDao;
import com.weiyu.domain.User;
import com.weiyu.domain.UserRole;
import com.weiyu.service.RoleService;
import com.weiyu.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhouyulong
 * @date 2018/10/11 下午2:55.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;



    /**
     * 跳转登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        System.out.println("This is login");
        return "login";
    }

    /**
     * 用户登录和密码
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(HttpServletRequest request) {

        //获得request传来的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //获取当前用户
        Subject subject = SecurityUtils.getSubject();
        //通过用户名和密码获取到令牌
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        String error = "";
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            error = "您输入用户名不存在！";
        } catch (IncorrectCredentialsException e) {
            error = "用户名或者密码错误！";
        } catch (AuthenticationException e) {
            e.printStackTrace();
            error = "其他的登录错误";
        }
        //验证是否成功登录
        if (subject.isAuthenticated()) {
            return "redirect:/";
        } else {
            request.setAttribute("error", error);
            return "login";
        }

    }

    /**
     * 退出登录
     *
     * @return
     */
    @RequestMapping(value = "/logout")
    @ResponseBody
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "注销ok!";
    }

    /**
     * 用户列表
     *
     * @return
     */
    @RequiresPermissions("user:list")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String UserList(Model model) {
        List<User> userList = userService.selectUser();
        model.addAttribute("userList", userList);
        return "user/list";
    }

    /**
     * 新增用户
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showAdd(Model model) {
        setRoles(model);
        return "user/add";
    }

    /**
     * 新增用户
     *
     * @param user
     * @return
     */
    @RequiresPermissions("user:add")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public User addUser(User user, Long... roleIds) {
        userService.addUser(user, roleIds);
        return user;
    }


    /**
     * 跳转修改用户页面
     *
     * @param id
     * @param model
     * @return
     */
    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdate(@PathVariable("id") Long id, Model model) {
        setRoles(model);
        if (userService.findById(id) != null) {
            model.addAttribute("userRole", userService.findById(id));
        }
        model.addAttribute("userRole", userService.findByUserRole(id));
        return "user/edit";
    }


    /**
     * 修改用户信息
     * @return
     */
    @RequiresPermissions("user:update")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> update(User user, Long urId, Long... roleIds) {
        Map<String,Object> map = new HashMap<>();
        System.out.println("--------"+user.getUsername()+"-----------");
        if (userService.findByUserRolesId(user.getId())!=null) {
            userService.updateUserRoles(user, urId, roleIds);
            map.put("msg", "OK!");
            map.put("data", "----------"+user+"----------urId:"+urId+"---------roleIds:"+roleIds);
        } else {
            userService.addUserRole(user, roleIds);
            map.put("msg", "OK!");
            map.put("data", user);
        }
        return map;

    }


    /**
     * 删除用户信息
     *
     * @param userId
     */
    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteUser(Long userId) {
        userService.deleteUser(userId);
    }

    private void setRoles(Model model) {
        model.addAttribute("roleList", roleService.findRoles());
    }

    /**
     * 测试用户角色
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id}/ceshi", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updates(@PathVariable("id") Long id) {
        Map<String, Object> map = new HashMap<>();
        if (userService.findById(id) != null) {
            map.put("data", userService.findById(id));
        }
        map.put("data", userService.findByUserRole(id));

        return map;
    }




}
