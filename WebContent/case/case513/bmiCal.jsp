<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>计算BMI</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case513/bmi.jsp" method="get">
      <label>体重：</label><input type="text" name="w"/><label>kg</label>
      <label>身高：</label><input type="text" name="h"/><label>cm</label>
      <input type="submit"/>
    </form>
  </body>
</html>






