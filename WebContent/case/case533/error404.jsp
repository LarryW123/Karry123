<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
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
  </head>
  
  <body>
    <%@ page isErrorPage="true"%><%--习惯上把本句放在JSP页面的第一句 --%>
    <%
      out.print("3秒后自动跳转......");//有兴趣的同学可以自己编写倒计时脚本
      response.setHeader("Refresh", "3;url=http://localhost:8080/Demo/index.jsp");
    %>
  </body>
</html>
