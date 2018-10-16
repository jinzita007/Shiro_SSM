package com.weiyu.service.impl;

import com.weiyu.dao.PermissionDao;
import com.weiyu.domain.Permission;
import com.weiyu.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhouyulong
 * @date 2018/10/16 下午1:37.
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public List<Permission> findAllPermission(){
        return permissionDao.findAllPermission();
    }

    @Override
    public void addPermission(Permission permission){
        permissionDao.addPermission(permission);
    }
}
