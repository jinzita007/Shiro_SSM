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
//
//    /**
//     * 跳转权限页面
//     * @return
//     */
//    @RequiresPermissions("permission:list")
//    @RequestMapping(value = "list", method = RequestMethod.GET)
//    @ResponseBody
//    public String PermissionList(Model model){
//        List<Permission> permissionList = permissionService.findAllPermission();
//        model.addAttribute("permissionList", permissionList);
//        return "permission/list";
//    }

    /**
     * 跳转权限页面
     * @return
     */
    @RequiresPermissions("permission:list")
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String PermissionList(){
        return "permission/list";
    }

//    @RequiresPermissions("permission:list")
    @RequestMapping(value = "permlist", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> PermissionLists(){
        Map<String, Object> map = new HashMap<>();
        List<Permission> permissionList = permissionService.findAllPermission();
        map.put("data", permissionList);
        return map;
    }



    /**
     * 跳转新增权限页面
     * @return
     */
    @RequiresPermissions("permission:add")
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String showPermission() {
        return "permission/add";
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
     * 添加子节点
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping(value = "{pid}/appendChild", method = RequestMethod.GET)
    public String showAppendChild(@PathVariable("pid") Long pid, Model model) {
        Permission parent = permissionService.findOne(pid);
        model.addAttribute("parent", parent);
        return "permission/edit";
    }


//    @RequestMapping(value = "{pid}/appendChild", method = RequestMethod.GET)
//    public String showAppendChilds(@PathVariable("pid") Long pid, Model model) {
//        model.addAttribute("pid", pid);
//        return "permission/edit";
//    }



    /**
     * 增加子节点接口
     * @param permission
     * @return
     */
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
     * 删除角色
     * @param id
     */
    @RequiresPermissions("permission:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteRole(Long id){
        permissionService.deletePermission(id);
    }

    private void setPermissions(Model model) {
        model.addAttribute("permissionList", permissionService.findAllPermission());
    }
}
