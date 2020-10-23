<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="case641.falsePaging"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>假分页查询</title>
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
      falsePaging fp = new falsePaging();
      fp.getConnection();
      ResultSet rs = fp.getRs();
      //显示查询结果
      int ps = 0;//记录遍历次数
      for (int i=0;i<(pageNo-1)*pageSize;i++){
        rs.next();//1.先向下移动N条记录
      }
      ResultSetMetaData rsmd=rs.getMetaData();
      while (rs.next()){//2.再开始遍历记录集
        for (int j=1;j<=rsmd.getColumnCount();j++){
          out.print(rs.getString(j)+" ");
        }
        out.print("<br/>");
        ps++;
        if(ps>=pageSize){break;}//超过pageSize，则不再遍历
      }
      //显示结果
      ResultSet cnt = fp.getCnt();
      cnt.next();
      out.print("<br/>共有"+cnt.getString(1)+"条记录<br/>");
      //生成N个超链接
      double rsCnt = Integer.parseInt(cnt.getString(1));//记录数
      double pages = Math.ceil(rsCnt/pageSize);//页数
      for(int k=1;k<=pages;k++){
        out.print("<a href='case/case641/falsePaging.jsp?pageNo="+k+"&pageSize=6'>第"+k+"页 </a>");
      }
      //断开连接
      fp.closeConn();  
    }catch(Exception e){
      e.printStackTrace();
    }
    %>
  </body>
</html>
