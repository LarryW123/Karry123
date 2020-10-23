<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>测试scope作用范围</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <jsp:useBean id="s1" class="case711.student" scope="request"/>
    <label>学号：</label><jsp:getProperty name="s1" property="sequence"/><br/>
    <label>姓名：</label><jsp:getProperty name="s1" property="name"/><br/>
    <label>性别：</label><jsp:getProperty name="s1" property="sex"/><br/>
    <label>生日：</label><jsp:getProperty name="s1" property="birthday"/><br/>
  </body>
</html>
