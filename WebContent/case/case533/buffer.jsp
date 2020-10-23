<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>输出缓冲区与响应提交</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      out.print("Hello World<br/>");
      out.print("信息是否已经提交?"+response.isCommitted()+"<br/>");
      out.print("刷新缓冲区……<br/>");//此时输出流信息仍未提交给客户端
      response.flushBuffer(); //或用out.flush(); 此时输出流信息已提交到客户端
      out.print("信息是否已经提交?"+response.isCommitted()+"<br/>");
      out.flush();//再次提交给客户端
      out.close();//关闭输出流
    %>
  </body>
</html>
