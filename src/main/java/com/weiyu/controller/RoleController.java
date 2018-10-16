package com.weiyu.controller;

import com.weiyu.dao.RoleDao;
import com.weiyu.domain.Role;
import com.weiyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:10.
 * 角色控制层
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
    public String showRole() {
        return "role/add";
    }

    /**
     * 新增角色
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addRole(Role role){
        Map<String,Object> map = new HashMap<>();
        roleService.addRole(role);
        System.out.println("-----------"+role.getId()+"-----------");
        System.out.println("-----------"+role.getName()+"-----------");
        map.put("msg", "OK!");
        return map;
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

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteRole(Long id){
        roleService.deleteRole(id);
    }

}
