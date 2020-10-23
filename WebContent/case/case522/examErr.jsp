<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>错误页</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta http-equiv="refresh" content="5; url=http://www.baidu.com/" />
  </head>
  
  <body>
    <%
      StackTraceElement a[]=exception.getStackTrace();
      out.print("出错原因："+exception+"<br>");
      out.print("出错的文件："+a[0].getFileName()+"<br>");
      out.print("出错的方法名："+a[0].getMethodName()+"<br>");
      out.print("出错的行号："+a[0].getLineNumber()+"<br>");
    %>
  </body>
</html>
