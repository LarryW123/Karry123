<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>表单数据提交</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 方法一：利用提交表单调用servlet -->
    <form action="case/case513/change.jsp" method="get">
      <input type="text" id="dollar" name="dollar"/>
      <input type="submit">
    </form>
    <!-- 方法二：利用超链接调用servlet -->
    <script type="text/javascript">
      function fn(){
    	var s=document.getElementById("dollar").value;
    	var str="case/case513/change.jsp?dollar="+s;
    	document.getElementById("a").setAttribute("href",str);
      }
    </script>
    <a id="a" href="#" onclick="fn()">提交</a>
  </body>
</html>
