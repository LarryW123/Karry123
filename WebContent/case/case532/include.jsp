<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>include</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    out.print("Hello <br/>");
    out.print("World<br/>");
    RequestDispatcher rd= request.getRequestDispatcher("/case/case532/includeTo.jsp");
    rd.include(request,response);
    out.print(request.getAttribute("attr"));
  %>
  </body>
</html>
