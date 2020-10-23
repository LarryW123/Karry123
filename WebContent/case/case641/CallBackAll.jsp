<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>全部事务回滚</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/teaching";
      String user = "root";
      String password = "123";
      Connection con = null;
      PreparedStatement pst1 = null;
      PreparedStatement pst2 = null;
      try{
        con = DriverManager.getConnection(url, user, password);
        //关闭自动提交
        con.setAutoCommit(false);
        //事务1
        String sql1 ="insert into student(sequence,name,sex)values(?,?,?)";
        pst1 = con.prepareStatement(sql1); 
        pst1.setString(1,"20140102003");
        pst1.setString(2,"张三");
        pst1.setString(3,"男");
        pst1.executeUpdate();
        //事务2
        String sql2 ="insert into student(sequence,name,sex)values(?,?,?)";
        pst2 = con.prepareStatement(sql2);
        pst2.executeUpdate();
        
        out.print("操作成功");
      }catch(SQLException e){
        out.print("记录添加失败："+e);
        out.print("<br/>回滚全部事务……");
        con.rollback();
      }finally{
        //提交事务
        con.commit();
        //关闭连接
        if(pst1!=null){pst1.close();}
        if(pst2!=null){pst2.close();}
        if(con!=null){con.close();}
      }
    %>
  </body>
</html>
