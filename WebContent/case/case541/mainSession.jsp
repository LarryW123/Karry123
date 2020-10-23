<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用Session对象实现Session追踪</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      HttpSession se = request.getSession();
      String name=(String)se.getAttribute("name");
      if(name==null||name.length()==0) {
        response.sendRedirect("error.jsp");
      }
      else{
        out.print("欢迎"+name+"<br/>");
      }
      String pageNo="1";
      if(request.getParameter("pageNo")!=null){
        pageNo=request.getParameter("pageNo");
      }
      out.print("这是第"+pageNo+"页<br/>");
      for(int i=1;i<=10;i++){
        String temp="<a href='case/case541/mainSession.jsp?&pageNo="+i+"'>"+i+"</a>";
        out.print(temp+"&nbsp");
      }
    %>
  </body>
</html>
