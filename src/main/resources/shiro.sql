-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018-10-19 14:30:49
-- 服务器版本： 5.6.35
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `my_shiro`
--

-- --------------------------------------------------------

--
-- 表的结构 `sys_permission`
--

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_permission`
--

INSERT INTO `sys_permission` (`id`, `name`, `url`, `pid`, `code`) VALUES
(1, '用户管理', '/user', 0, 'user:*'),
(2, '用户列表', '/user/list', 1, 'user:list'),
(3, '新增用户', '', 1, 'user:add'),
(4, '编辑用户', '', 1, 'user:update'),
(5, '删除用户', '', 1, 'user:delete'),
(6, '角色管理', '/role', 0, 'role:*'),
(7, '角色列表', '/role/list', 6, 'role:list'),
(8, '新增角色', '', 6, 'role:add'),
(9, '编辑角色', '', 6, 'role:update'),
(10, '删除角色', '', 6, 'role:delete'),
(11, '权限管理', '/permission', 0, 'permission:*'),
(12, '权限列表', '/permission/list', 11, 'permission:list'),
(13, '新增权限', '', 11, 'permission:add'),
(14, '编辑权限', '', 11, 'permission:update'),
(15, '删除权限', '', 11, 'permission:delete');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role`
--

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_role`
--

INSERT INTO `sys_role` (`id`, `name`) VALUES
(1, '超级管理员'),
(2, '管理员'),
(3, 'Administrator'),
(4, '测试人员'),
(8, '普通'),
(11, '测试02'),
(12, '测试03');

-- --------------------------------------------------------

--
-- 表的结构 `sys_role_permission`
--

CREATE TABLE `sys_role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_role_permission`
--

INSERT INTO `sys_role_permission` (`id`, `role_id`, `permission_id`) VALUES
(3, 11, 7),
(6, 12, 1),
(7, 12, 2),
(8, 12, 6),
(9, 1, 1),
(10, 1, 6),
(11, 1, 11),
(13, 2, 1),
(14, 2, 6);

-- --------------------------------------------------------

--
-- 表的结构 `sys_user`
--

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_user`
--

INSERT INTO `sys_user` (`id`, `username`, `email`, `password`) VALUES
(1, 'woaitianwen', 'woaitianwen@qq.com', '123456'),
(2, 'yuyi', 'yuyi@qq.com', '123456'),
(3, 'xiao9', 'xiaohong@qq.com', '1234'),
(16, 'demo01', 'admin@qq.com', '123'),
(22, 'ss', 'ss@qq.com', 'SS'),
(23, 'sss', 'sss@qq.com', 'sss'),
(24, 'sunlu', 'sunlu@yahoo.com', '123456'),
(27, 'jj', 'jj@qq.com', 'jj'),
(28, 'fok', 'fok@yahoo.com', '123456'),
(29, 'kk', 'xiaoxiao@qq.com', 'kk'),
(30, 'xiao', 'xiaohong@qq.com', '123456'),
(33, 'dede', 'dede@qq.com', 'dede'),
(34, 'vv1', 'vv', 'vv');

-- --------------------------------------------------------

--
-- 表的结构 `sys_user_role`
--

CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sys_user_role`
--

INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 16, 4),
(5, 24, 3),
(7, 27, 4),
(8, 28, 1),
(9, 29, 1),
(10, 3, 2),
(11, 30, 2),
(13, 34, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_permission`
--
ALTER TABLE `sys_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_role`
--
ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_role_permission`
--
ALTER TABLE `sys_role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sys_user_role`
--
ALTER TABLE `sys_user_role`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `sys_permission`
--
ALTER TABLE `sys_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `sys_role`
--
ALTER TABLE `sys_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `sys_role_permission`
--
ALTER TABLE `sys_role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- 使用表AUTO_INCREMENT `sys_user_role`
--
ALTER TABLE `sys_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;