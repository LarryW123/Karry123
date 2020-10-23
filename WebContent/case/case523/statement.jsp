<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>声明示例</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
    <%!int count1=0;%>
    <%int count2=0; %>
  <body>
    <%count1++;%>
    <%count2++; %>
    <p>您是第<%=count1%>位访问者</p>  
    <p>您是第<%=count2%>位访问者</p> 
  </body>

</html>
