<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,case731.conBean" %>
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
    <!-- 第三步：将数据库操作封装到一个Bean类 -->
    <!-- 通过调用Bean类来完成查询的数据在jsp页面中的显示 -->
    <!-- 不难发现，封装的数据库逻辑在页面中已经看不到了，JSP页面中只有几条简单的调用 -->
    <!-- 此时JSP页面中大部分代码都是用来显示和渲染表格 -->
    <%
    try{
      conBean cb=new conBean();//实例化
      cb.getConnection();//定义连接
      ResultSet rs = cb.stuSelect();//获取结果
      //生成表格
      ResultSetMetaData rsmd=rs.getMetaData();
      out.print("<table border='1px' cellspacing='0px' style='width:1000px;font-size:12px'>");
      //显示字段
      out.print("<tr>");
      for(int i=1;i<=rsmd.getColumnCount();i++){
        out.print("<th>"+rsmd.getColumnName(i)+"</th>");
      }
      out.print("</tr>");
      //显示记录
      while(rs.next()){
        out.print("<tr>");
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print("<td>"+rs.getString(i)+"</td>");
        }
        out.print("</tr>"); 
      }
      out.print("</table>");
      
      cb.closeConn();//断开连接
    }
    catch(Exception e){
      e.printStackTrace(); 
    }
    %>
  </body>
</html>
