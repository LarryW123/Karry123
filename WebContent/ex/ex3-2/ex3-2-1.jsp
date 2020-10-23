<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>add</title>
  </head>
  
  <body>
  <form action="ex32/ex321">
     <label>请输入一个数：</label>
     <input type="text" name="txt">
     <input type="submit" value="计算">
  <form>
  </body>
</html>
