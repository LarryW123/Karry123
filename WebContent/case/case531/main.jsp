<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>main</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      String name=request.getParameter("txtUserName");
      if(name==null||name.length()==0){
        out.print("用户名为空");
      }
      else{
        out.print("用户名="+name);
      }
      
      String pw=request.getParameter("txtPassword");
      if(pw==null||pw.length()==0){
        out.print("密码为空");
      }
      else{
        out.print("密码="+pw);
      }
    %>
  </body>
</html>
