<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>AJAX技术-get()和post()</title>
  </head>
  
  <body>
    <%
      request.setCharacterEncoding("utf-8");
      String userName = request.getParameter("userName");
      String password = request.getParameter("password");
      out.print("您发送的请求是:userName="+userName+"&password="+password);
    %>
</body>
</html>
