<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>累加</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <!-- 请给<body>中的java代码添加规范的注释  -->
  <!-- 1、说明程序的功能  -->
  <!-- 2、说明变量的含义  -->
  <!-- 3、说明程序的运行结果  -->
  <body>
  
    <% 
    /**
    * <summary>?</summary>
    * <param name="txt_Add">?</param>
    * <param name="max">?</param>
    * <param name="s">?</param>
    * <param name="i">?</param>
    * <returns>?</returns>
    */
      Integer max = Integer.parseInt(request.getParameter("txt_Add")); 
      int s = 0; 
      for(int i=0;i<=max;i++){ 
        s+=i; 
      } 
      out.print("1+2+3+...+"+ max + "=" + s); 
    %>
  </body>
</html>
