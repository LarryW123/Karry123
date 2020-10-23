<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>getTo</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <% 
      String s="您选择的是：";
      try{
        String str=new String(request.getParameter("test").getBytes("ISO-8859-1"),"utf-8");
        s+=str;
      }catch(Exception e){
        s="您没有选任何选项";
      }
      out.print(s);
    %>
  </body>
</html>
