<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
﻿<!-- 顶部导航 -->
﻿<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header" style="padding-top:5px">
      <a href="javascript:void(0)" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-toolbar-button">
        <span class="sr-only">切换导航</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <img src="/Demo/case/case741/img/logo.png" style="width:40px;height:40px;display:inline;">
      <span style="font-size:20px;font-family:'微软雅黑';">教学管理系统</span>
    </div>
    <div class="navbar-collapse collapse" id="navbar-toolbar-button">
      <ul class="nav navbar-nav navbar-right">
        <!-- 以下JSTL表达式：如果存在Session则显示用户；如果不存在则显示登录注册 -->
        <c:choose>
          <c:when test="${empty sessionScope.sequence}">
            <li><a href="javascript:void(0)" data-toggle="modal" data-target="#md_login">登录</a></li>
            <li><a href="javascript:void(0)" data-toggle="modal" data-target="#md_regist">注册</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="javascript:void(0)">
              <img src="/Demo/case/case741/img/users/user-default.png" style="width:20px;height:20px;">
              <label>${sessionScope.nickName}【${sessionScope.role}】<label>
            </a></li>
            <li><a href="javascript:void(0)" data-toggle="modal" data-target="#md_changeImg">更换头像</a></li>
            <li><a href="javascript:void(0)" data-toggle="modal" data-target="#md_password">修改密码</a></li>
            <li><a href="javascript:void(0)" id="a_exit">注销</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</nav>

<style>
  a{text-decoration:none;}
  a:hover{text-decoration:none;}
</style>
<script type="text/javascript" src="/Demo/case/case741/js/header.js"></script>