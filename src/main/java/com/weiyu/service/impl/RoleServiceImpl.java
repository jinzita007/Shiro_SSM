package com.weiyu.service.impl;

import com.weiyu.dao.RoleDao;
import com.weiyu.domain.Role;
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
    public void addRole(Role role){
        roleDao.addRole(role);
    }

    @Override
    public List<Role> findRoles(){
        return roleDao.findRoles();
    }
}
