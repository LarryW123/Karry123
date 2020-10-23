<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>数据库逻辑封装</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 第二步：动态生成表格，显示查询的数据 -->
    <!-- 此时，数据库逻辑与表格显示混在一起了 -->
    <!-- 如果在JSP页面中加入HTML代码以显示其他内容，代码的可读性和可维护性会降低 -->
    <!-- 可以想象的出来，随着显示内容的增加，页面可读性会越来越差 -->
    <!-- 如果把JSP页面中的代码全部写进servlet，编程效率会更低 -->
    <%
    try{
      //初始化
      String driverClass="com.mysql.jdbc.Driver";
      String url="jdbc:mysql://localhost:3306/teaching";
      String userName="root";
      String passWord="123";
      String sql="select * from student";
      //连接数据库
      Class.forName(driverClass);//加载驱动
      Connection conn = DriverManager.getConnection(url,userName,passWord);//创建连接
      Statement stmt = conn.createStatement(); //创建连接状态
      ResultSet rs = stmt.executeQuery(sql);//执行查询
      //利用表格输出结果集
      ResultSetMetaData rsmd=rs.getMetaData();
      out.print("<table border='1px' cellspacing='0px' style='width:1000px;font-size:12px'>");
      out.print("<tr>");
      for(int i=1;i<=rsmd.getColumnCount();i++){
        out.print("<th>"+rsmd.getColumnName(i)+"</th>");
      }
      out.print("</tr>");
      while(rs.next()){
        out.print("<tr>");
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print("<td>"+rs.getString(i)+"</td>");
        }
        out.print("</tr>"); 
      }
      out.print("</table>");
      //断开连接
      rs.close();
      stmt.close();
      conn.close();  
    }
    catch(Exception e){
      e.printStackTrace();
    }
    %>
  </body>
</html>
