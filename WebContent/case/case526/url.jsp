<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>URL标记</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 测试import标记 -->
      <c:import url="http://www.weather.com.cn" charEncoding="utf-8"/>
    <!-- 测试redirect标记 -->
      <c:redirect url="http://www.baidu.com"/>
    <!-- 测试URL和param标记 -->
      <c:url value="case/case622/exp.jsp" var="url" scope="session">
        <c:param name="user" value="admin"/>
      </c:url>
      <a href="${url}">跳转</a>
  </body>
</html>
