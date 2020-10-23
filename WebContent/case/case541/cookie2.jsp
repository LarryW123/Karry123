<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie,java.net.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>测试界面二</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      Cookie co[]=request.getCookies();
      for(int i=0;i<co.length;i++){
        String name=co[i].getName(); 
        String value=co[i].getValue();
        out.print(name+"："+URLDecoder.decode(value)+"<br/>");
      }
      //1、尝试在前面添加cookie的有效期
      //2、尝试在其他目录下添加cookie测试作用范围，再加上setPath以后又会怎样？
     %>
  </body>
</html>
