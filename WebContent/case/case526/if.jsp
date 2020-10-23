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
    <title>条件标记</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 测试if标记 -->
      <c:if test="${empty user}" var="user" scope="session">
      <c:set var="user" value="张三" scope="session"/>
        ${sessionScope.user}
      </c:if>
    <!-- 测试choose、when、otherwise标记 -->
      <c:choose>
        <c:when test="${empty user}">
          <br/>请先登录
        </c:when>
        <c:otherwise>
          <br/>欢迎${sessionScope.user}
        </c:otherwise>
      </c:choose>
  </body>
</html>
