package com.weiyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhouyulong
 * @date 2018/10/16 上午8:11.
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String doIndex() {
        return "index";
    }
}
