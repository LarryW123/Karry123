<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>sendRedirectTo</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      //利用getAttribute()来获取request中的属性值
      String id = (String)request.getAttribute("id");
      String name = (String)request.getAttribute("name");
      String className = (String)request.getAttribute("className");
      //格式化输出
      out.print("学号："+id+"<br/>");
      out.print("姓名："+name+"<br/>");
      out.print("班级："+className+"<br/>");
    %>
  </body>
</html>
