<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>forward</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    //利用setAttribute()给request添加三个属性
    request.setAttribute("id","20180101001");
    request.setAttribute("name","张三丰");
    request.setAttribute("className","信息A1811");
    //将request转发给另一个页面
    RequestDispatcher rd= request.getRequestDispatcher("/case/case532/forwardTo.jsp");
    rd.forward(request, response); 
  %>
  </body>
</html>





