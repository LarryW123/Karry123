<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>消息国际化</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
  </head>
  
  <body>
    <!-- 格式1： -->
    <!-- 绑定资源文件保存到变量 -->
    <fmt:setBundle basename="case526.msg_zh_CN" var="msg"/>
    <!-- 读取资源文件中的消息 -->
    <fmt:message key="id" bundle="${msg}" />
    <fmt:message key="name" bundle="${msg}" />
    <fmt:message key="sex" bundle="${msg}" />
    <fmt:message key="age" bundle="${msg}" />
    <br/>
    <!-- 格式2： -->
    <fmt:bundle basename="case526.msg_zh_CN">
      <fmt:message key="id"/>
      <fmt:message key="name"/>
      <fmt:message key="sex"/>
      <fmt:message key="age"/>
    </fmt:bundle>
  </body>
</html>
