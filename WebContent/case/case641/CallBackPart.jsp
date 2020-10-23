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
    <title>部分事务回滚</title>
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
        Savepoint sp1 = null;
        PreparedStatement pst2 = null;
        Savepoint sp2 = null;
        PreparedStatement pst3 = null;
        Savepoint sp3 = null;
        int counter = 0;
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
          sp1 = con.setSavepoint();
          counter = 1;
          //事务2
          String sql2 ="insert into student(sequence,name,sex)values(?,?,?)";
          pst2 = con.prepareStatement(sql2); 
          pst2.setString(1,"20140102004");
          pst2.setString(2,"李四");
          pst2.setString(3,"女");
          pst2.executeUpdate();
          sp2 = con.setSavepoint();
          counter = 2;
          //事务3
          String sql3 ="insert into student(sequence,name,sex)values(?,?,?)";
          pst3 = con.prepareStatement(sql3);
          pst3.executeUpdate();
          sp3 = con.setSavepoint();
          counter = 3;
          out.print("操作成功");
      }catch(SQLException e){
        out.print("记录添加失败："+e);
        out.print("<br/>回滚部分事务");
        switch (counter){
          case 1:
            con.rollback(sp1);break;
          case 2:
            con.rollback(sp2);break;
          case 3:
            con.rollback(sp3);break;
          default:
            con.rollback();break;
        }
      }finally{
        //提交事务
        con.commit();
        //关闭连接
        if(pst1!=null){pst1.close();}
        if(pst2!=null){pst2.close();}
        if(pst3!=null){pst3.close();}
        if(con!=null){con.close();}
      }
    %>
  </body>
</html>
