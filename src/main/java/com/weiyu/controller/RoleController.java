package com.weiyu.controller;

import com.weiyu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhouyulong
 * @date 2018/10/13 上午9:10.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;



}
