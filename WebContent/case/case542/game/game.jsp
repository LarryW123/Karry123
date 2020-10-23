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
    <title>随机数判断</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
    String msg = request.getParameter("msg");
	if(msg != null && msg.length() != 0){
      out.println(new String(msg.getBytes("iso-8859-1"),"utf-8"));
    }
   %>
  <form action="/Demo/case/case542/game/judge.jsp" method="post">
    <label>请输入要猜的数:</label>
    <input type="text" name="num"/>
    <input type="submit"/>
  </form>
  </body>
</html>
