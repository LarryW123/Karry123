<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="case641.truePaging"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>真分页查询</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
    String strPageNo = request.getParameter("pageNo");
    int pageNo = 1;//页数，默认为第一页
    if (strPageNo != null && strPageNo.length() > 0){
      pageNo = Integer.parseInt(strPageNo);
    }
    
    String strPageSize = request.getParameter("pageSize");
    int pageSize = 6;//每页记录数，默认每页显示6条记录
    if (strPageSize != null && strPageSize.length() > 0){
      pageSize = Integer.parseInt(strPageSize);
    }
    
    try{
      //实例化
      truePaging tp = new truePaging();
      tp.getConnection();
      ResultSet rs = tp.getRs(pageNo,pageSize);
      //遍历查询结果
      ResultSetMetaData rsmd=rs.getMetaData();
      while (rs.next()){
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print(rs.getString(i)+" ");
        }
        out.print("<br/>");
      }
      //显示结果
      ResultSet cnt = tp.getCnt();
      cnt.next();
      out.print("<br/>共有"+cnt.getString(1)+"条记录<br/>");
      //生成N个超链接
      double rsCnt = Integer.parseInt(cnt.getString(1));//记录数
      double pages = Math.ceil(rsCnt/pageSize);//页数
      for(int k=1;k<=pages;k++){
        out.print("<a href='case/case641/truePaging.jsp?pageNo="+k+"&pageSize=6'>第"+k+"页 </a>");
      }
      //断开连接
      tp.closeConn();  
    }catch(Exception e){
      e.printStackTrace();
    }
    %>
  </body>
</html>
