<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>循环标记</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 测试forEach标记 -->
    <%
      List list = new ArrayList();
      list.add("20100102034");
      list.add("jerry");
      list.add("男");
      list.add("2000-1-1");
      request.setAttribute("list", list);
    %>
    <c:forEach items="${requestScope.list}" begin="0" var="value" varStatus="id">
      ${id.index+1}:${value}<br/>
    </c:forEach>
    
    <!-- 测试forTokens标记 -->
    <c:set var="str" value="JavaWeb课程包括：HTML、CSS、JavaScript、jQuery、JSON、AJAX、XML、JAVA、OOP、SQL、JDBC、Servlet、JSP、JavaBean、MVC"/>
    <c:forTokens items="${str}" delims="：、" var="s">
      ${s}<br/>
    </c:forTokens>
  </body>
</html>
