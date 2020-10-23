<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>汇率换算</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    String s = request.getParameter("dollar");
    if(s != null && s.length() > 0){
      double n = Double.parseDouble(s);
      double result = n*7.8;
      out.print(s+" 美元= "+result+"人民币");
    }
  %>
  </body>
</html>
