package com.weiyu.controller;

import com.weiyu.domain.Permission;
import com.weiyu.domain.Role;
import com.weiyu.domain.RolePermission;
import com.weiyu.service.PermissionService;
import com.weiyu.service.RoleService;
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
 * @date 2018/10/13 上午9:10.
 * 角色控制层
 */
@CrossOrigin
@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    /**
     * 查询所有角色信息
     * @param model
     * @return
     */
    @RequiresPermissions("role:list")
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String RoleList(Model model) {
        List<Role> roleList = roleService.findRoles();
        model.addAttribute("roleList", roleList);
        return "role/list";
    }

    /**
     * 查询权限信息
     * @return
     */
    @RequestMapping(value = "role_list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> queryByRole() {
        Map<String,Object> map = new HashMap<>();
        List<Permission> permissionList = permissionService.findAllPermission();

        map.put("msg", "ok");
        map.put("data", permissionList);
        return map;
    }

    /**
     * 跳转新增角色页面
     * @return
     */
    @RequiresPermissions("role:add")
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String showRole(Model model) {
        setPermissions(model);
        return "role/add";
    }

    /**
     * 新增角色
     * @return
     */
    @RequiresPermissions("role:add")
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addRole(Role role, Long... permissionIds){
        Map<String,Object> map = new HashMap<>();
        map.put("msg", "OK!");
        map.put("name", role.getName());
        map.put("permissionIds", permissionIds);
        return map;
    }

//    /**
//     * 获取角色ID
//     * @param id
//     * @return
//     */
//    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    public Map<String, Object> showUpdate(@PathVariable("id") Long id) {
//        Map<String,Object> map = new HashMap<>();
//        List<RolePermission> rolePermissionList = roleService.findByRolePermission(id);
//        map.put("role", roleService.findByRolePermission(id));
//        if (roleService.findById(id)!=null) {
//            map.put("data", roleService.findById(id));
//            map.put("role", rolePermissionList);
//        }
//        return map;
//
//    }

    /**
     * 跳转编辑角色页面
     * @param id
     * @param model
     * @return
     */
    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdate(@PathVariable("id") Long id, Model model) {
        if (roleService.findById(id)!=null) {
            model.addAttribute("data", roleService.findById(id));
        }
        return "role/edit";
    }

    /**
     * 根据角色权限查询角色ID
     * @param id
     * @return
     */
    @RequiresPermissions("role:update")
    @RequestMapping(value = "/roleperm/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> updateRole(@PathVariable("id") Long id) {
        Map<String,Object> map = new HashMap<>();
        List<RolePermission> rolePermissionList = roleService.findByRolePermission(id);
        map.put("rolePermissionList", rolePermissionList);
        return map;

    }


    /**
     * 更新角色接口
     * @param role
     * @param permissionIds
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateRole(Role role, Long... permissionIds) {
        Map<String,Object> map = new HashMap<>();
        roleService.updateRole(role, permissionIds);
        map.put("msg", "OK!");
        map.put("name", role.getName());
        map.put("permissionIds", permissionIds);
        return map;

    }

    /**
     * 删除角色
     * @param id
     */
    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteRole(Long id){
        roleService.deleteRole(id);
    }

    private void setPermissions(Model model) {
        model.addAttribute("permissionList", permissionService.findAllPermission());
    }

}
