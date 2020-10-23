<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Session作用范围变量</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    HttpSession se=request.getSession();
    se.setMaxInactiveInterval(60);//设置有效时间为60秒
    se.setAttribute("name","张三");
    se.setAttribute("sex","男");
    se.setAttribute("age",26);
    se.setAttribute("className","信息A1011");
    response.sendRedirect("getID.jsp");
  %>
  </body>
</html>
