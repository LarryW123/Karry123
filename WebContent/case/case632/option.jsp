<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>操作数据库</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <!-- 将form的action分别设置为 /case632/st、/case632/pst、/case632/cst查看效果-->
  <body>
    <form action="/Demo/case632/st" method="post">
      <label>学号：</label><input type="text" name="sequence"/><br/><br/>
      <label>姓名：</label><input type="text" name="name"/><br/><br/>
      <label>性别：</label>
        <select name="sex" style="width:150px">
          <option value="男">男</option>
          <option value="女">女</option>
        </select><br/><br/>
      <label>生日：</label><input type="date" name="birthday"/><br/><br/>     
      <input type="radio" name="optRecord" value="1"/>添加记录
      <input type="radio" name="optRecord" value="2"/>删除记录
      <input type="radio" name="optRecord" value="3"/>更新记录
      <input type="submit" value="提交"/>
    </form>
  </body>
</html>
