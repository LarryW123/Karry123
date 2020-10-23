<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>读取系统信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      out.print("协议及版本号:"+request.getProtocol()+"<br/>");
      out.print("本机IP："+request.getRemoteAddr()+"<br/>");
      out.print("服务器IP："+request.getRemoteHost()+"<br/>");
      out.print("构造规则："+request.getScheme()+"<br/>");
      out.print("服务器域名："+request.getServerName()+"<br/>");
      out.print("端口号："+request.getServerPort()+"<br/>");
      out.print("当前系统路径："+request.getContextPath()+"<br/>");
      out.print("查询字串："+request.getQueryString()+"<br/>");
      out.print("请求资源的URI："+request.getRequestURI()+"<br/>"); 
      out.print("请求资源的URL："+request.getRequestURL()+"<br/>"); 
      out.print("提交方式："+request.getMethod()+"<br/>");
      out.print("调用Servlet程序的URL："+request.getServletPath()+"<br/>");
      out.print("真实路径："+request.getRealPath(request.getServletPath()));
    %>
  </body>
</html>
