<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>annotation</title>
  </head>
  <body>
  <!-- 请给以下代码加上合理的注释，注释中说明： -->
  <!-- 1、代码的作用 -->
  <!-- 2、用到了哪些变量，变量的含义 -->
  <!-- 3、程序运行结果是什么？运行结果的输出格式 -->
    <% 
    /**
    * <summary>代码的作用</summary>
    * <param name="变量1">变量的含义1</param>
    * <param name="变量2">变量的含义2</param>
    * <returns>运行结果的输出格式</returns>
    */
      String n = request.getParameter("n");
      Integer max = Integer.parseInt(n);
      int s = 0;
      for(int i=0;i<=max;i++){
        s+= i;
      }
      out.print("1+2+3+...+" + max + "=" + s);
    %>
  </body>
</html>
