<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Enumeration</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    //Enumeration是java.util的一个接口类，封装了有关枚举数据集合的方法
    //Enumeration的hasMoreElements()用来判断集合中是否还有其他元素
    //Enumerration的nextElement()用来获取下一个元素名
    Enumeration e=request.getParameterNames();
    while(e.hasMoreElements()){
      String varName=e.nextElement().toString();
      String varValue=request.getParameter(varName);
      out.print(varName +"="+ varValue+"<br>");
    }
  %>
  </body>
</html>
