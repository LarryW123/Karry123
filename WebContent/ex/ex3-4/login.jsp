<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
  </head>
  
  <body>
    <form action="ex34/judge" method="post">
      <label>账号：</label>
      <input type="text" name="userName">
      <br/><br/>
      <label>密码：</label>
      <input type="password" name="password">
      <br/><br/>
      <input type="submit" value="登录"> 
    </form>
  </body>
</html>
