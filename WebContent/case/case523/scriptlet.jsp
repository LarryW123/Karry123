<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>脚本示例</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <%
      int n=100,sum=0;
      String str="result=";
    %>
  </head>
    <%
      for(int i=0;i<=n;i++){      
        sum+= i;
      }
    %>
  <body>
    <% 
      out.println(str+sum); 
    %>
  </body>
</html>
