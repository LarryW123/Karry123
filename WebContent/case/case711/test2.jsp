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
    <label>姓名：</label><jsp:getProperty name="s1" property="name"/>
    <label>性别：</label><jsp:getProperty name="s1" property="sex"/>
  </body>
</html>
