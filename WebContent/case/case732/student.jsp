<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,case732.*,java.util.ArrayList" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <base href="<%=basePath%>">
  <title>MVC开发模式</title>
  <meta http-equiv="content-type" content="text/html;charset=UTF-8">
  <!-- 各层功能：-->
  <!-- JSP页面:展现界面和数据，大部分时候，可以直接用HTML页面来编写代码-->
  <!-- DAO层:封装数据库逻辑-->
  <!-- Service层:调用DAO层逻辑来实施具体业务；接收和返回数据-->
  <!-- Action层:向ServiceDAO层下达任务；接收和返回数据-->
  <!-- view页面:展现处理结果数据-->
  <!-- 至此，我们就完全分开了“UI设计”、“业务逻辑”、“数据库逻辑”，大大降低了程序的耦合-->
</head>
  
<body>
  <form action="case732/StudentAction" method="post">
    <table style=" font-size:12px">
      <tr><td colspan="10">
        <select name="type">
          <option value="name">姓名</option>
          <option value="sex">性别</option>
          <option value="nation">民族</option>
          <option value="political">政治面貌</option>
        </select>
        <select name="judge">
          <option value=">">大于</option>
          <option value="<">小于</option>
          <option value="=">等于</option>
        </select>
        <input type="text" name="condition"/>
        <input type="submit" id="btnQuery" name="sbmBtn" value="查询" />
      </td></tr>
      <tr>
        <td>序号：</td><td><input type="text" name="id"></td>
        <td>学号：</td><td><input type="text" name="sequence"></td>
        <td>姓名：</td><td><input type="text" name="name"></td>
        <td>性别：</td><td><input type="text" name="sex"></td>
        <td>出生日期：</td><td><input type="date" name="birthday"></td>
      </tr>
      <tr>
        <td>身份证号：</td><td><input type="text" name="card"></td>
        <td>政治面貌：</td><td><input type="text" name="political"></td>
        <td>民族：</td><td><input type="text" name="nation"></td>
        <td>籍贯：</td><td><input type="text" name="nativePlace"></td>
        <td>班级：</td><td><input type="text" name="className"></td>
      </tr>
      <tr>
        <td colspan="10">
          <input type="submit" name="sbmBtn" value="添加" />
          <input type="submit" name="sbmBtn" value="修改" />
          <input type="submit" name="sbmBtn" value="删除" />
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
