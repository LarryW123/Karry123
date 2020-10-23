<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="case721.toExcel"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>利用POI导出表格数据到Excel</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
<!-- 
  response.setHeader("content-disposition", "attachment;filename="+ HttpBrower.getDownFileName(request,"学生基本信息表.xls"));
  response.setContentType("application/force-download");//不打开强制下载
-->
  <body>
  <a href="case/case721/toExcel.jsp?yesNo=yes">利用POI导出表格数据到Excel</a>
  <%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
    String user = "root";
    String password = "123";
    Connection conn = DriverManager.getConnection(url,user,password);
    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery("select * from student");

    out.println("<table border='1px'>");
    out.println("<tr>");
    ResultSetMetaData rsmd=rs.getMetaData();
    for (int i=1;i<=rsmd.getColumnCount();i++){
      out.println("<th>"+rsmd.getColumnName(i)+"</th>");
    }
    out.println("</tr>");
    while(rs.next()){
      out.println("<tr>");
      for (int i=1;i<=rsmd.getColumnCount();i++){
        out.println("<td>"+rs.getString(i)+"</td>");
      }
    }
    out.println("</table>");
    //利用POI导出表格数据到Excel
    rs.beforeFirst();
    String expToExcel = request.getParameter("yesNo");
    if (expToExcel != null && expToExcel.toString().equalsIgnoreCase("yes")) {
      toExcel xls=new toExcel();
      xls.toxls(rs);
    }
  %>
  </body>
</html>
