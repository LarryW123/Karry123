<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
<html>
  <head>
    <title>I18N数字格式化</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <fmt:setLocale value="fr_fr" />法语：
    <fmt:formatNumber value="46987532.15" />
    <hr>
    <fmt:setLocale value="en_us" />英语：
    <fmt:formatNumber value="46987532.15" />
    <hr>
  </body>
</html>