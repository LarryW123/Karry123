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
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case531/main.jsp">
      <label>账号：</label>
      <input type="text" name="txtUserName">
      <label>密码：</label>
      <input type="password" name="txtPassword">
      <input type="submit" value="登录" id="btnSubmit"> 
    </form>
  </body>
</html>
