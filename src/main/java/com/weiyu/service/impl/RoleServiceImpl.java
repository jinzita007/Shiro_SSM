package com.weiyu.service.impl;

import com.weiyu.dao.RoleDao;
import com.weiyu.domain.Role;
import com.weiyu.domain.RolePermission;
import com.weiyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:07.
 */

@Service("roleService")
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> findRoles(){
        return roleDao.findRoles();
    }

    @Override
    public List<RolePermission> findByRolePermission(Long id) {
        return roleDao.findByRolePermission(id);
    }

    @Override
    public Role findById(Long id) {
        return roleDao.findById(id);
    }

    @Override
    public void deleteRole(Long id){
        roleDao.deleteRole(id);
    }

    @Override
    public void addRole(Role role, Long... permissionIds) {
        roleDao.addRole(role);
        if(permissionIds != null && permissionIds.length>0 ) {
            for (Long permissionId : permissionIds) {
                System.out.println("--------角色id: "+role.getId()+"-----------角色权限ID: "+permissionId);
                roleDao.addRolePermission(new RolePermission(role.getId(),permissionId));
            }
        }
    }

    @Override
    public void updateRole(Role role, Long... permissionIds) {
        roleDao.updateRole(role);
        roleDao.deleteRolePermission(role.getId());
        if(permissionIds != null && permissionIds.length>0 ) {
            for (Long permissionId : permissionIds) {
                System.out.println("--------角色id: "+role.getId()+"-----------角色权限ID: "+permissionId);
                roleDao.addRolePermission(new RolePermission(role.getId(), permissionId));
            }
        }

    }


//    @Override
//    public void addRolePermissions(Long id, Long... permissionIds) {
//        if(permissionIds != null && permissionIds.length>0 ) {
//            for (Long permissionId : permissionIds) {
//                System.out.println("--------角色id: "+id+"-----------角色权限ID: "+permissionId);
//                roleDao.addRolePermission(new RolePermission(id, permissionId));
//            }
//        }
//    }
}
