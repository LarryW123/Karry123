<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>include示例</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div id="topdiv" style="width:600px;margin:0 auto">
      <%@include file="inc/logo.inc"%>
      <%@include file="inc/nav.inc"%>
      <%@include file="inc/main.inc"%>
      <%@include file="inc/footer.inc"%>
    </div>
  </body>
</html>
