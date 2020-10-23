<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>check</title>
  </head>
  
  <body>
  <form action="ex32/ex322">
    <label>请选择一个爱好：</label>
    <input type="checkbox" name="like" value="game">游戏
    <input type="checkbox" name="like" value="write">书法
    <input type="checkbox" name="like" value="music">音乐
    <input type="checkbox" name="like" value="draw">绘画
    <input type="checkbox" name="like" value="read">阅读
    <input type="submit" value="提交">
  </form>
  </body>
</html>
