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
    <title>表达式标记</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 测试out的default属性 -->
      <!-- 格式一：无标签体 -->
      <c:out value="${user}" default="user值为空"/><br/>
      <!-- 格式二：有标签体 -->
      <c:out value="${user}">
        user值为空
      </c:out><br/>
    <!-- 测试out的escapeXml属性 -->
      <c:out value="&lt" escapeXml="true"/><br/>
      <c:out value="&lt" escapeXml="false"/><br/>
      ---------------------------------------------<br/>
      
    <!-- 测试set的scope属性 -->
      <c:set var="user" value="张三" scope="page"/>
      ${pageScope.user}<br/>
    <!-- 测试set的target属性 -->
      <jsp:useBean class="case526.Student" id="stu"/>
      <c:set property="sex" value="男" target="${stu}"/>
      ${stu.sex}<br/>
      ---------------------------------------------<br/>
      
    <!-- 测试remove的scope属性 -->
      <c:remove var="user" scope="session"/>
      <c:out value="${sessionScope.user}" default="user值为空"/><br/>
      ---------------------------------------------<br/>
      
    <!-- 测试catch -->
      <c:catch var="exp">
        <%
          int num=Integer.parseInt(request.getParameter("num"));
          out.print(num);
        %>
      </c:catch>
      <c:out value="${exp}"/><br/>
  </body>
</html>
