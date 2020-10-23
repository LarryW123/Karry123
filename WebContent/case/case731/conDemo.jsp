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
    <!-- 第一步：在jsp页面中显示查询的数据 -->
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
      ResultSet rs = stmt.executeQuery(sql); //执行查询 
      //遍历查询结果
      ResultSetMetaData rsmd=rs.getMetaData();
      while(rs.next()){
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print(rs.getString(i)+" ");
        }
        out.print("<br/>");
      }
      //断开连接
      rs.close();
      stmt.close();
      conn.close();  
      }catch(Exception e){
        e.printStackTrace();
    }
    %>
  </body>
</html>
