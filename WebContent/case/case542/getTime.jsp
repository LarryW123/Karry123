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
    <title>Session作用范围变量</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      HttpSession se=request.getSession();
      se.setAttribute("info", "保存一个Session数据");
      
      long ct=se.getCreationTime();
      Calendar calCt=Calendar.getInstance();
      calCt.setTimeInMillis(ct);
      int year=calCt.get(Calendar.YEAR);
      int month=calCt.get(Calendar.MONTH)+1;
      int day=calCt.get(Calendar.DAY_OF_MONTH);
      int hour=calCt.get(Calendar.HOUR_OF_DAY);
      int min=calCt.get(Calendar.MINUTE);
      int sec=calCt.get(Calendar.SECOND);
      int msec=calCt.get(Calendar.MILLISECOND);
      out.print("Session 创建时间："+year+"-"+month+"-"+day+"  "+hour+":"+min+":"+sec+"."+msec);
      out.print("<br/>");
      
      long lat=se.getLastAccessedTime();
      Calendar calLat=Calendar.getInstance();
      calLat.setTimeInMillis(lat);
      year=calLat.get(Calendar.YEAR);
      month=calLat.get(Calendar.MONTH)+1;
      day=calLat.get(Calendar.DAY_OF_MONTH);
      hour=calLat.get(Calendar.HOUR_OF_DAY);
      min=calLat.get(Calendar.MINUTE);
      sec=calLat.get(Calendar.SECOND);
      msec=calLat.get(Calendar.MILLISECOND);
      out.print("最后一次通信时间："+year+"-"+month+"-"+day+"  "+hour+":"+min+":"+sec+"."+msec);
    %>
  </body>
</html>
