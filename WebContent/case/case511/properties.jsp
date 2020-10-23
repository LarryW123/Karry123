<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>读取properties文件</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
   <%
    Properties pro = new Properties(); 
    String realpath = request.getRealPath("/");
    try{
      FileInputStream fis = new FileInputStream(realpath+"case/case511/pig.properties"); 
      pro.load(fis);
      String mode = pro.getProperty("mode");
      String music = pro.getProperty("music");
      String sound = pro.getProperty("sound");
      String name = pro.getProperty("name");
      String realName = new String(name.getBytes("iso-8859-1"),"utf-8");
      out.print("模式:"+mode+"<br/>");
      out.print("音乐:"+music+"<br/>");
      out.print("音效:"+sound+"<br/>");
      out.print("姓名:"+realName);
      fis.close();
    }  
    catch(Exception e){  
      out.println(e);  
    }
   %>
  </body>
</html>
