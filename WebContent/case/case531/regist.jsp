<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>regist</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case531/Enumeration.jsp">
      <label>账号：</label>
      <input type="text" name="userName"><br/>
      <label>密码：</label>
      <input type="password" name="pw"><br/>
      <label>确认密码：</label>
      <input type="password" name="againPw"><br/>
      <label>性别：</label>
      <input type="radio" name="sex" value="male">男
      <input type="radio" name="sex" value="female">女<br/>
      <input type="submit" value="注册" id="btnSubmit"> 
    </form>
  </body>
</html>
