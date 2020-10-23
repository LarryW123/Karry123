<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <title>学生管理</title>
  
  <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- IE兼容 -->
  <meta name="renderer" content="webkit"><!-- 国产浏览器高速模式 -->
  
  <link rel="Shortcut Icon" href="/Demo/index/logo.ico"><!-- 标题栏图标 -->
  <link rel="Bookmark" href="/Demo/index/logo.ico" /><!-- 收藏夹图标 -->
  
  <link type="text/css" rel="stylesheet" href="/Demo/case/case741/bootstrap/css/bootstrap.min.css"/><!--Bootstrap核心CSS文件-->
  <link type="text/css" rel="stylesheet" href="/Demo/case/case741/icomoon/style.css"/><!--图标样式文件-->
  
  <link type="text/css" rel="stylesheet" href="/Demo/case/case741/bootstrap/css/bootstrap-table.min.css"/><!--Bootstrap表格CSS文件-->
  <link type="text/css" rel="stylesheet" href="/Demo/case/case741/bootstrap/css/bootstrap-multiselect.css"/><!--Bootstrap下拉列表框CSS文件-->
  <link type="text/css" rel="stylesheet" href="/Demo/case/case741/bootstrap/css/jquery.fix-messager.css"/><!--jquery消息框CSS文件-->
  
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/jquery.min.js"></script><!--引入JQuery的JS文件：一定要在BootStrap的JS的文件的前面引入-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/bootstrap.js"></script><!--Bootstrap核心JavaScript文件-->
  
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/bootstrap-table.js"></script><!--Bootstrap表格插件-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/bootstrap-multiselect.js"></script><!--Bootstrap表格插件-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/bootstrap-table-zh-CN.js"></script><!--Bootstrap国际化插件-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/bootstrap-table-export.js"></script><!--Bootstrap表格导出插件-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/jquery.fix-messager.js"></script><!--jquery消息框插件-->
  <script type="text/javascript" src="/Demo/case/case741/bootstrap/js/tableExport.js"></script><!--Bootstrap表格导出插件-->
</head>

<body>
  <!-- 顶部信息 -->
  <div class="container-fluid">
    <%@ include file="/case/case741/inc/header.inc" %>
  </div>
  <!-- 中部信息 -->
  <div class="container-fluid">
    <div class="row">
      <!-- 左侧导航 -->
      <div class="col-md-2">
        <%@ include file="/case/case741/inc/navbar.inc" %>
      </div>
      <!-- 右侧表格 -->
      <div class="col-md-10">
        <%@ include file="/case/case741/inc/student/tb_student.inc" %>
      </div>
    </div>
  </div>
  <!-- 页面相关模态框 -->
  <%@ include file="/case/case741/inc/student/md_student.inc" %><!-- 添加\修改学生 -->
  <%@ include file="/case/case741/inc/md_password.inc" %><!-- 修改密码 -->
  <%@ include file="/case/case741/inc/md_changeImg.inc" %><!-- 更换头像 -->
  <!-- 页面相关脚本 -->
  <script type="text/javascript" src="/Demo/case/case741/js/student.js"></script>
</body>
</html>