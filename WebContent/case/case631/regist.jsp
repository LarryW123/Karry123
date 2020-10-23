<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户注册</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <div>
      <form>
        <label>账号：</label>
        <input type="text" name="userName"/><br/><br/>
        <label>密码：</label>
        <input type="password" name="passWord"/><br/><br/>
        <label>重复密码：</label>
        <input type="password" name="rePassWord"/><br/><br/>
        <input type="submit" value="注册"/>
        <input type="reset" value="重置"/>
      </form>
    </div>
  </body>
</html>
