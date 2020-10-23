<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>测试scope作用范围</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <jsp:useBean id="s1" class="case711.student" scope="application"/>
    <jsp:setProperty name="s1" property="sequence" value="20001011010"/>
    <jsp:setProperty name="s1" property="name" value="赵四"/>
    <jsp:setProperty name="s1" property="sex" value="女"/>
    <jsp:setProperty name="s1" property="birthday" value="2010-10-10"/>
    <jsp:forward page="scope2.jsp"/>
  </body>
</html>
