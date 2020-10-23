<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Session作用范围变量</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      HttpSession se=request.getSession();
      se.removeAttribute("age");
      Enumeration e=se.getAttributeNames();
      String name=null;
      while(e.hasMoreElements()){
        name=(String)e.nextElement();
        out.print(name+"："+se.getAttribute(name)+"<br>");
      }
    %>
  </body>
</html>




