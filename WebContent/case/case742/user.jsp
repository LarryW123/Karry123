<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>会员管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <!-- 核心样式文件 -->
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo/demo.css">
    <!-- 核心脚本文件 -->
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <!-- 国际化脚本文件 -->
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <!-- 自定义样式 -->
    <style type="text/css">
      a{color:blue;text-decoration:none}
      a:vlink{color:blue}
      a:hover{color:red}
    </style>
    <!-- 自定义脚本 -->
    <script type="text/javascript"  src="js/util.js"></script>
</head>
<body>
  <div class="easyui-layout" data-options="fit:true">
    <!-- 顶部logo -->
    <div data-options="region:'north'" style="height:60px;">
      <%@include file="inc/header.inc" %>
    </div>
    <!-- 底部信息 -->
    <div data-options="region:'south'" style="height:30px;line-height:30px">
      <%@include file="inc/footer.inc" %>
    </div>
    <!-- 左侧导航 -->
    <div data-options="region:'west'" style="width:200px;">
      <%@include file="inc/navicate.inc" %>
    </div>
    <!-- 右侧帮助 -->
    <div data-options="region:'east'" title='使用帮助'style="width:200px;">
      <%@include file="inc/user_help.inc" %>
    </div>
    <!-- 主体部分 -->
    <div data-options="region:'center'">
      <%@include file="inc/user_field.inc"%>
      <%@include file="inc/user_toolbar.inc"%>
      <%@include file="inc/user_dialog.inc"%>
    </div>
  </div>
  <%-- 自定义脚本 --%>
  <script type="text/javascript" src="js/option.js"></script>
</body>
</html>
