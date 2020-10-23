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
    <%
      int s=0;
      for(int i=0;i<=100;i++){
      	s+=i;
      }
      out.print(s);
     %>
  </body>
</html>
