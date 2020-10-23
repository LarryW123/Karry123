<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>显示BMI</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      String strW = request.getParameter("w");
      String strH = request.getParameter("h");
      double w = Double.parseDouble(strW);
      double h = Double.parseDouble(strH);
      double bmi = 10000*w/h/h;
      out.println("bm1="+bmi);
     %>
  </body>
</html>








