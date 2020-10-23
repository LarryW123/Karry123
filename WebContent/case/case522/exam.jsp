<%@ page language="java" import="java.util.*" pageEncoding="utf-8"  errorPage="examErr.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>自定义错误页</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
     <%
       String s=null;
       int i=s.length();
       out.print(i);
     %>
  </body>
</html>
