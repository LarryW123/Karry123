<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>错误页</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <style type="text/css">
      .info{padding-top:60px;text-align:center;width:600px;position:absolute;left:0px;top:0px;right:0px;bottom:0px;margin:auto;}
      p,span{font-size:12px;color:#969696;height:20px}
      a{font-size:12px;color:#969696;}
      a:hover{font-size:12px;color:#4A708B;}
    </style>
  </head>
  
  <body>
    <div class="info">
      <span>错误原因：页面未找到</span>
      <a href="/Demo/index.jsp">返回首页</a><br/>
      <img src="case/case541/images/error.png">
      <p>可能由于网络原因，造成数据访问产生错误！如果多次产生同样错误，请联系管理员排查！</p>
    </div>
  </body>
</html>
