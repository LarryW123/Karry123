<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,case732.*,java.util.ArrayList" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
  <title>MVC开发模式</title>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
</head>
  
<body>
  <%
  //向StudentAction发送请求
  ArrayList<Student> studentList = (ArrayList)request.getAttribute("stuList");
  if(studentList==null){
    RequestDispatcher rd= request.getRequestDispatcher("/case732/StudentAction");
    rd.forward(request, response); 
  }else{
    //处理StudentAction响应的结果
    out.print("<table border='1px' cellspacing='0px' style='width:1000px;font-size:12px'>");
    for(Student stuTmp:studentList){
      out.print("<tr>");
      out.print("<td>"+stuTmp.getId()+"</td>");
      out.print("<td>"+stuTmp.getSequence()+"</td>");
      out.print("<td>"+stuTmp.getName()+"</td>");
      out.print("<td>"+stuTmp.getSex()+"</td>");
      out.print("<td>"+stuTmp.getBirthday()+"</td>");
      out.print("<td>"+stuTmp.getCard()+"</td>");
      out.print("<td>"+stuTmp.getPolitical()+"</td>");
      out.print("<td>"+stuTmp.getNation()+"</td>");
      out.print("<td>"+stuTmp.getNativePlace()+"</td>");
      out.print("<td>"+stuTmp.getClassName()+"</td>");
      //out.print("<td><a id='"+stuTmp.getId()+"' href='javascrpit:void(0)' onclick='del()'>删除</a></td>");
      out.print("</tr>");
    }
    out.print("</table>");
  }
  %>
</body>
</html>
