<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>通过响应报文类型导出Excel(不推荐)</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <%
    String exportToExcel = request.getParameter("exportToExcel");
    if (exportToExcel != null && exportToExcel.toString().equalsIgnoreCase("YES")) {
      response.setContentType("application/vnd.ms-excel");
      String fileName = java.net.URLEncoder.encode("学生基本信息表", "UTF-8");
      response.setHeader("Content-Disposition", "inline; filename="+ fileName +".xls");
    }
    if (exportToExcel == null) {
  %>
    <a href="case/case721/excel.jsp?exportToExcel=YES">通过响应报文类型导出到Excel</a>
  <%
    }
  %>
  
  <body>
  <%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
    String user="root";
    String password="123";
    Connection conn = DriverManager.getConnection(url,user,password);
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("select * from student");
  %>
  <table style="border:1px double red">
    <tr>
      <%
        ResultSetMetaData rsmd=rs.getMetaData();
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.println("<th style='border:1px double red'>"+rsmd.getColumnName(i)+"</th>");
        }
      %>
    </tr>
    <%
      while(rs.next()){
        out.println("<tr>");
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.println("<td style='border:1px double red'>"+rs.getString(i)+"</td>");
        }
        out.println("</tr>");
      }
    %>
  </table>
  <%
    //关闭记录集
    if(rs!=null){
      try{rs.close();}
      catch(SQLException e){e.printStackTrace();}
    }
    //关闭声明
    if(stmt!=null){
      try{stmt.close();}
      catch(SQLException e){e.printStackTrace();}
    }
    //关闭连接对象
    if(conn!=null){
      try{conn.close();}
      catch(SQLException e){e.printStackTrace();}
    }
  %>
  </body>
</html>
