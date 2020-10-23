<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>JDBC技术</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
  <%
    //1、加载JDBC驱动程序
    Class.forName("com.mysql.jdbc.Driver");
    //2、提供JDBC的URL
    String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
    String user="root";
    String password="123";
    //3、与数据库建立连接
    Connection conn = DriverManager.getConnection(url,user,password);
    //4、创建Statement实例
    Statement stmt=conn.createStatement();
    //5、执行SQL语句并返回结果
    ResultSet rs=stmt.executeQuery("select * from student");
    //6、处理数据库返回的结果
  %>
  <table style="width:80%;border:1px double red;margin:0 auto;">
    <tr>
      <%
        //(6.1)获取列名
        ResultSetMetaData rsmd=rs.getMetaData();
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.println("<th style='border:1px double red;'>"+rsmd.getColumnName(i)+"</th>");
        }
      %>
    </tr>
    <%
      //(6.2)遍历记录集
      while(rs.next()){
        out.println("<tr>");
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.println("<td style='border:1px double red;'>"+rs.getString(i)+"</td>");
        }
        out.println("</tr>");
      }
    %>
  </table>
  <%
    //7、断开属于数据库的连接
    //(7.1)关闭记录集
    if(rs!=null){
      try{rs.close();}
      catch(SQLException e){e.printStackTrace();}
    }
    //(7.2)关闭实例
    if(stmt!=null){
      try{stmt.close();}
      catch(SQLException e){e.printStackTrace();}
    }
    //(7.3)关闭连接对象
    if(conn!=null){
      try{conn.close();}
      catch(SQLException e){e.printStackTrace();}
    }
  %>
  </body>
</html>
