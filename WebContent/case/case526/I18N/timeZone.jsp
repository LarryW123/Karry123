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
    <title>I18N日期格式化</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <fmt:setLocale value="zh_cn" />方法一
    <hr>北京：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" timeZone="EST"/>
    <hr>东京：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" timeZone="CST"/>
    <hr>纽约：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" timeZone="MST"/>
    <hr>伦敦：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" timeZone="PST"/>
    <hr>方法二
    
    <hr>
    <fmt:setTimeZone value="HST" />夏威夷标准时间：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
    <fmt:setTimeZone value="GMT" />格林威治标准时间：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
    <fmt:setTimeZone value="MIT" />西萨摩亚时间：
    <fmt:formatDate value="${date}" type="both" dateStyle="full" timeStyle="full" />
    <hr>
  </body>
</html>