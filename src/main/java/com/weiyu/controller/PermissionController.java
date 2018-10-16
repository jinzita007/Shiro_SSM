package com.weiyu.controller;

import com.weiyu.domain.Permission;
import com.weiyu.service.PermissionService;
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
 * @date 2018/10/16 下午1:26.
 * 权限控制层
 */
@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 跳转权限页面
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String PermissionList(Model model){
        List<Permission> permissionList = permissionService.findAllPermission();
        model.addAttribute("permissionList", permissionList);
        return "permission/list";
    }

    /**
     * 跳转新增权限页面
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String showPermission() {
        return "permission/add";
    }

    /**
     * 新增权限接口
     * @param permission
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPermission(Permission permission) {
        Map<String, Object> map = new HashMap<>();
        permissionService.addPermission(permission);
        map.put("msg", "新增成功！");
        return map;
    }
}
