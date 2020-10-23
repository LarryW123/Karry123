<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>bmi</title>
  </head>
  <body> 
  <%
    String h=request.getParameter("h");
    String w=request.getParameter("w");
    if(h==null || h.length()==0 || w==null || w.length()==0){
      out.println("没有参数");
    }
    else{
      double h1=Double.parseDouble(h);
      double w1=Double.parseDouble(w);
      double bmi=h1/w1;
      out.println("height="+h1+"<br>");
      out.println("weight="+w+"<br>");
      out.println("bmi="+bmi);
    }
  %>
  </body>
</html>
