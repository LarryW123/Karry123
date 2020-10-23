<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>get</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case531/getTo.jsp" method="get">
      <label>请选择您的最喜欢的运动：</label><br/>
      <input type="radio" name="test" value="乒乓球">乒乓球<br/>
      <input type="radio" name="test" value="羽毛球">羽毛球<br/>
      <input type="radio" name="test" value="足球">足球<br/>
      <input type="radio" name="test" value="蓝球">蓝球<br/>
      <input type="submit" value="提交">
      <input type="reset" value="重置">
    </form>
  </body>
</html>
