<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>regist</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form action="case/case531/submit.jsp" method="post">
      <label>爱好：</label>
      <input type="checkbox" name="hobby" id="sport" value="运动"/>运动 
      <input type="checkbox" name="hobby" id="draw" value="绘画"/>绘画 
      <input type="checkbox" name="hobby" id="read" value="阅读"/>阅读
      <input type="submit" value="提交" id="btnSubmit"> 
    </form>
  </body>
</html>
