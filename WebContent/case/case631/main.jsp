<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>主界面</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 方法一：JSP表达式 -->
    <label>欢迎您：<%=session.getAttribute("userId")%></label>
    <!-- 方法二：EL表达式 -->
    <label>[${sessionScope.role}]</label>
    
    <br/>-----------------应用一：JSP代码--------------------<br/>
    <%
      if(session.getAttribute("userId")==null){
        out.println("<a href='javascript:void(0);'>登录</a>");
        out.println("<a href='javascript:void(0);'>注册</a>");
      }else{
        out.println("欢迎您："+session.getAttribute("userId"));
        out.println("["+session.getAttribute("role")+"]");
      }
    %>
    
    <br/>-----------------应用二：EL表达式--------------------<br/>
    <c:choose>
      <c:when test="${empty userId}">
        <a href="javascript:void(0);">登录</a>
        <a href="javascript:void(0);">注册</a> 
      </c:when>
      <c:otherwise>
        <label>欢迎您：${sessionScope.userId}</label>
        <label>[${sessionScope.role}]</label>
      </c:otherwise>
    </c:choose>
  </body>
</html>
