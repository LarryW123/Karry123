<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case751/main.jsp" method="post">
      <label>账号：</label><input type="text" name="userName"/>
      <label>密码：</label><input type="password" name="password"/>
      <input type="submit" value="登录"/>
    </form>
  </body>
</html>
