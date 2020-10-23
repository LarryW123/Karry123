<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="case711.student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>直接调用JavaBean</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 对student实例化以后，就可以直接使用get()获取值了 -->
    <!-- 输出格式一 -->
    <% 
      student stu = new student();
      out.println(stu.getSequence()+"<br/>");
      out.println(stu.getName()+"<br/>");
      out.println(stu.getSex()+"<br/>");
      out.println(stu.getBirthday()+"<br/><br/>");
    %>
    <!-- 也可以使用其set()进行赋值 -->
    <%  
      stu.setSequence("20010506007");
      stu.setName("李四");
      stu.setSex("女");
      stu.setBirthday("1999-9-9");
    %>
    <!-- 输出格式二 -->
    <%=stu.getSequence()+"<br/>"%>
    <%=stu.getName()+"<br/>"%>
    <%=stu.getSex()+"<br/>"%>
    <%=stu.getBirthday()+"<br/>"%>
  </body>
</html>
