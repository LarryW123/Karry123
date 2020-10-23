<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>EL常规运算符</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <!-- 算术运算符：+、-、*、/、% -->
    <br/>算术运算 3*(8+4) % 5 的结果：${3*(8+4) % 5}<br/>
    ------------------------------------
  <!-- 关系运算符：<、>、<=、>=、==、!= -->
    <br/>关系运算 7 < 5 的结果：${7 < 5}<br/>
    ------------------------------------
  <!-- 逻辑运算符：&&、||、! -->
    <br/>逻辑运算 5==3 && 5<9 || !(5>=12) 的结果：${5==3 && 5<9 || !(5>=12)}<br/>
    ------------------------------------
  <!-- 条件运算符：? -->
    <%
      int x=3;
      int y=6;
    %>
    <br/>条件运算x>y ? "正确" : "错误"的结果：${x>y ? "正确" : "错误"}<br/>
    ------------------------------------
  </body>
</html>
