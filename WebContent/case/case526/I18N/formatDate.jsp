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
    <title>I18N地区时间</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <fmt:setLocale value="fr_fr" />法语：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
    <fmt:setLocale value="en_us" />英语：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
    <fmt:setLocale value="zh_cn" />简体中文：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
    <fmt:setLocale value="zh_HK" />繁体中文：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
  </body>
</html>