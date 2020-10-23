<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>return</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    try {
      String varValue[]=request.getParameterValues("hobby");
      for(int n=0;n<varValue.length;n++){
        out.print("hobby="+varValue[n]+"<br>");
      }
    } catch (Exception e) {
      out.println("你还没有选择爱好");
    }
  %>
  </body>
</html>
