package com.weiyu.controller;

import com.weiyu.domain.Permission;
import com.weiyu.service.PermissionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhouyulong
 * @date 2018/10/16 下午1:26.
 * 权限控制层
 */
@CrossOrigin
@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * 跳转权限页面
     * @return
     */
    @RequiresPermissions("permission:list")
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String doPermissionList(){
        return "permission/list";
    }

    /**
     * 权限列表接口
     * @return
     */
    @RequiresPermissions("permission:list")
    @RequestMapping(value = "permlist", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> PermissionList(){
        Map<String, Object> map = new HashMap<>();
        List<Permission> permissionList = permissionService.findAllPermission();
        map.put("data", permissionList);
        return map;
    }


    /**
     * 新增权限接口
     * @param permission
     * @return
     */
    @RequiresPermissions("permission:add")
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addPermission(Permission permission) {
        Map<String, Object> map = new HashMap<>();
        permissionService.addPermission(permission);
        map.put("msg", "新增成功！");
        return map;
    }


    /**
     * 增加子节点接口
     * @param permission
     * @return
     */
    @RequiresPermissions("permission:add")
    @RequestMapping(value = "{pid}/appendChild", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> create(Permission permission) {
        Map<String, Object> map = new HashMap<>();
        permissionService.addPermission(permission);
        map.put("msg", "新增子节点成功！");
        map.put("data", permission);
        return map;
    }

    /**
     * 更新权限接口
     * @param permission
     * @return
     */
    @RequiresPermissions("permission:update")
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(Permission permission) {
        Map<String, Object> map = new HashMap<>();
        permissionService.updatePermission(permission);
        map.put("msg", "新增子节点成功！");
        map.put("data", permission);
        return map;
    }

    /**
     * 删除权限
     * @param id
     */
    @RequiresPermissions("permission:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteRole(Long id){
        permissionService.deletePermission(id);
    }

}
