<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>forwardTo</title>
  </head>
  
  <body>
    <%
      //利用getAttribute()来获取request中的属性值
      String userName = (String)request.getAttribute("userName");
      String password = (String)request.getAttribute("password");
      //格式化输出
      out.print("账号："+userName+"<br/>");
      out.print("密码："+password+"<br/>");
    %>
  </body>
</html>
