<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie,java.net.*"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>利用Cookie传值</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    request.setCharacterEncoding("utf-8");//统一请求编码
    response.setCharacterEncoding("utf-8");//统一响应编码
    
    String str=request.getParameter("txtName");
    String name=URLEncoder.encode(str);//对需要进行保存的数据进行编码，后面需要使用的时候再解码
    
    Cookie co=new Cookie("userName",name);//添加属性
    response.addCookie(co);//添加到cookie
    
    co=new Cookie("sex","female");//添加新属性
    response.addCookie(co);//继续添加到cookie

    response.sendRedirect("cookie1.jsp");//重定向 ，但不会造成cookie的丢失，区分request作用范围变量
   %>
  </body>
</html>
