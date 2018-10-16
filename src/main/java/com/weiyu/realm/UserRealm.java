package com.weiyu.realm;

import com.weiyu.domain.User;
import com.weiyu.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author zhouyulong
 * @date 2018/10/11 下午4:00.
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    //设置realm的名称
    @Override
    public void setName(String name) {
        super.setName("userRealm");
    }

    /**
     * 用于认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        // 从token中获取用户身份信息
        String username = (String) token.getPrincipal();
        //从数据库中查找用户信息
        User user = userService.selectByUserName(username);

        //如果身份认证验证成功，返回一个AuthenticationInfo实现；
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(),this.getName());

        return simpleAuthenticationInfo;

    }
    /**
     * 用于授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.setRoles(userService.findByRoles(username));
        simpleAuthorizationInfo.setStringPermissions(userService.findByPermissions(username));
        return simpleAuthorizationInfo;
    }


}
