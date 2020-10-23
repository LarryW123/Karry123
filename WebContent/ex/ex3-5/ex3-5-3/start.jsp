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
    <title>生成随机数</title>
  </head>
  
  <body>
    <%
      int rnd=(int)(Math.random()*100);
      HttpSession se=request.getSession();
      se.setAttribute("rnd",rnd);
      response.sendRedirect("game.jsp");
     %>
  </body>
</html>
