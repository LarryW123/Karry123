<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>使用JSP动作调用JavaBean</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <jsp:useBean id="s1" class="case711.student" scope="request"/>
    <jsp:setProperty name= "s1" property="name" value="赵四"/>
    <jsp:setProperty name="s1" property="sex" value="女"/>
    <jsp:forward page="test2.jsp"/>
  </body>
</html>
