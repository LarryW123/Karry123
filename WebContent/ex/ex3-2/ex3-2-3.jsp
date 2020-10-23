<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>radio</title>
  </head>
  
 <body>
<form action="ex32/ex323">
  <label>请选择您的最喜欢的运动：</label>
  <input type="radio" name="test" value="A">乒乓球
  <input type="radio" name="test" value="B">羽毛球
  <input type="radio" name="test" value="C">足球
  <input type="radio" name="test" value="D">蓝球
  </p>
  <input type="submit" value="提交">
</form>
</body>
</html>
