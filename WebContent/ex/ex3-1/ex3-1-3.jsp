<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>hello world</title>
  </head>
  <body>
  <%
    String s=request.getParameter("h");
    if(s==null || s.length()==0){
      out.println("没有参数");
    }
    else{
      double h=Double.parseDouble(s);
      for (int i=0;i<h;i++){
        out.print("Hello World !"+"<br>");
      }
    }
  %>
  </body>
</html>
