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
    <div>
      <form action="/Demo/case631/check" method="post">
        <label>账号：</label>
        <input class="txt" type="text" name="userName"/><br/><br/>
        <label>密码：</label>
        <input class="txt" type="password" name="passWord"/><br/><br/>
        <input class="btn" type="submit" value="登录"/>
        <input class="btn" type="reset" value="重置"/>
      </form>
    </div>
  </body>
</html>
