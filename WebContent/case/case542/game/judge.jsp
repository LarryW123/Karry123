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
    <title>随机数判断</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%! int count=0; %>
    <%
	HttpSession se = request.getSession();
	String strRnd = se.getAttribute("rnd").toString();
    String strNum  = request.getParameter("num");
	if(strNum != null && strNum.length() != 0){
      int rnd = Integer.parseInt(strRnd);
      int num = Integer.parseInt(strNum);
      if(num<rnd){
        count++;
        String msg = new String("小了".getBytes("utf-8"),"ISO-8859-1");
        response.sendRedirect("game.jsp?msg="+msg);
      }
      else if(num>rnd){
        count++;
        String msg = new String("大了".getBytes("utf-8"),"ISO-8859-1");
        response.sendRedirect("game.jsp?msg="+msg);
      }
      else{
        count++;
        se.setAttribute("result", count);
        response.sendRedirect("result.jsp");
	}
  }
   %>
  </body>
</html>
