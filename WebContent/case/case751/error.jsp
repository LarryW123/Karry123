<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>错误页</title>
    <meta http-equiv="Refresh" content="3;url='case/case751/login.jsp'">
  </head>
  
  <body>
    <p>您还没有登录，3秒后返回……</p>
  </body>
</html>
