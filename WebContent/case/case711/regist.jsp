<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>表单数据封装</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <!-- 如果使用EL表达式，可以使用 -->
  <!-- <form action="case/case721/display.jsp"> -->
  <body>
    <form action="case711/display" method="post">
      <label>账号：</label>
      <input type="text" name="userName"><br/>
      <label>密码：</label>
      <input type="text" name="password"><br/>
      <label>性别：</label>
      <input type="radio" name="sex" value="male"/>男
      <input type="radio" name="sex" value="female"/>女<br/>
      <label>爱好：</label>
      <input type="checkbox" name="hobby" value="game"/>游戏
      <input type="checkbox" name="hobby" value="draw"/>绘画
      <input type="checkbox" name="hobby" value="sport"/>运动
      <input type="checkbox" name="hobby" value="sing"/>歌曲<br/>
      <label>备注：</label>
      <textarea rows="5" cols="20" name="memo"></textarea><br/>
      <input type="submit" value="提交">
    </form>
  </body>
</html>
