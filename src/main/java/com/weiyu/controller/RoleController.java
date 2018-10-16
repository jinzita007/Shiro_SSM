package com.weiyu.controller;

import com.weiyu.domain.Role;
import com.weiyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:10.
 */
@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 跳转新增角色页面
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addRole() {
        return "role/add";
    }

    /**
     * 查询所有角色信息
     * @param model
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String RoleList(Model model) {
        List<Role> roleList = roleService.findRoles();
        model.addAttribute("roleList", roleList);
        return "role/list";
    }

}
