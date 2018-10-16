package com.weiyu.domain;

/**
 * @author zhouyulong
 * @date 2018/10/12 下午4:33.
 */
public class RolePermission {
    private Long id;
    private Long roleId;
    private Long permissionId;

    public RolePermission(Long id, Long permissionId) {
        this.id = id;
        this.permissionId = permissionId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Long permissionId) {
        this.permissionId = permissionId;
    }
}
