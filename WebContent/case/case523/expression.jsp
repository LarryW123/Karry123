<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>表达式示例</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      int hour=new Date().getHours();
      String str=null;
      if(hour<5){str="凌晨";}
      else if(hour<8){str="清晨";}
      else if(hour<12){str="上午";}
      else if(hour<14){str="中午";}
      else if(hour<18){str="下午";}
      else if(hour<20){str="傍晚";}
      else {str="晚上";}
    %>
    <%= new Date().toString() %>现在是<%=str %>
  </body>
</html>
