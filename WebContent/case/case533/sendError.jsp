<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" errorPage="error404.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>返回404错误码</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      /*返回响应码*/
      response.sendError(404);
      /*2、再在web.xml中配置
      <error-page>  
        <error-code>404</error-code>  
        <location>/case/case533/error404.jsp</location>  
      </error-page>  
      */
    %>
  </body>
</html>
