<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,case731.DAO.*" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>JSP+DAO的设计(实现增删改查)</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
    <!-- 前后台代码功能：-->
    <!-- 1、DAO层:-->
    <!--   (1)封装数据库逻辑(DBUtil)； -->
    <!--   (2)封装表单数据到对象(Student)； -->
    <!--   (3)封装数据库操作(StdentDAO) -->
    <!-- 2、JSP页面:-->
    <!--   (1)展现界面和显示数据(form和table)； -->
    <!--   (2)通过调用DAO层逻辑来处理具体业务(Java片段)； -->
    <!-- 优点：更安全、更高效、更方便、更不易出错 -->
    <!--   (1)将表单提交的数据封装到一个对象的实例中，再向下传递 -->
    <!--   (2)将数据库返回的ResultSet封装到list集合，再向上传递 -->
    <!-- 缺点： -->
    <!--   (1)此时的JSP页面，代码量已经比较庞大了，如果出现更多的业务，JSP页面会更加臃肿 -->
    <!--   (2)如果需要处理较为复杂业务，例如转账、注册新用户、注销用户，这些业务的逻辑代码也必须出现在JSP页面 -->
    <!--   (3)另外，复杂的业务都会多次进行数据库的增删改查操作，每次操作都会涉及数据库连接和断开，此类的频繁操作会成为数据库访问的瓶颈，甚至导致服务器崩溃 -->
    <!--   (4)没有实现前后台代码的完全分离(JSP页面中，仍然是html代码与java片段共存) -->
  <body>
    <form action="case/case731/studentServiceDAO.jsp" method="post">
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
        <input type="submit" name="sbmBtn" value="查询" />
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
    <%
    int id;
    String sequence = null;
    String name = null;
    String sex = null;
    String polotical = null;
    String nation = null;
    String birthday = null;
    String card = null;
    String nativePlace = null;
    String className = null;
    
    request.setCharacterEncoding("utf-8");
    String sbmBtn = null;
    int value = 1;
    sbmBtn = request.getParameter("sbmBtn");
    if(sbmBtn!=null){
      if(sbmBtn.equals("查询")){value = 1;}
      if(sbmBtn.equals("添加")){value = 2;}
      if(sbmBtn.equals("修改")){value = 3;}
      if(sbmBtn.equals("删除")){value = 4;}
    }
    
    StudentServiceDAOimpl studentSD = new StudentServiceDAOimpl();
    Student student = new Student();
    switch (value){
    case 1://查询
      String type = request.getParameter("type");
      String judge = request.getParameter("judge");
      String condition = request.getParameter("condition");
      String sqlStr = type+judge+"'"+condition+"'";
      if (condition != null && condition.length() > 0){
        student.setCondition(sqlStr);
      }
      break;
    case 2://添加
      sequence = request.getParameter("sequence");
      name = request.getParameter("name");
      sex = request.getParameter("sex");
      polotical = request.getParameter("political");
      nation = request.getParameter("nation");
      birthday = request.getParameter("birthday");
      if(birthday == ""){birthday = null;}
      card = request.getParameter("card");
      nativePlace = request.getParameter("nativePlace");
      className = request.getParameter("className");
      student.setSequence(sequence);
      student.setName(name);
      student.setSex(sex);
      student.setPolitical(polotical);
      student.setNation(nation);
      student.setBirthday(birthday);
      student.setCard(card);
      student.setNativePlace(nativePlace);
      student.setClassName(className);
      studentSD.insert(student);
      break;
    case 3://修改
      id = Integer.parseInt(request.getParameter("id"));
      sequence = request.getParameter("sequence");
      name = request.getParameter("name");
      sex = request.getParameter("sex");
      polotical = request.getParameter("political");
      nation = request.getParameter("nation");
      birthday = request.getParameter("birthday");
      if(birthday==""){birthday=null;}
      card = request.getParameter("card");
      nativePlace = request.getParameter("nativePlace");
      className = request.getParameter("className");
      student.setId(id);
      student.setSequence(sequence);
      student.setName(name);
      student.setSex(sex);
      student.setPolitical(polotical);
      student.setNation(nation);
      student.setBirthday(birthday);
      student.setCard(card);
      student.setNativePlace(nativePlace);
      student.setClassName(className);
      studentSD.update(student);
      break;
    case 4://删除
      id = Integer.parseInt(request.getParameter("id"));
      student.setId(id);
      studentSD.delete(student);
      break;
    default:
      break;
    }
    //显示
    ArrayList<Student> studentList = studentSD.select(student);
    out.print("<table border='1px' cellspacing='0px' style='width:1000px;font-size:12px'>");
    for(Student stuTmp:studentList){
      out.print("<tr>");
      out.print("<td>"+stuTmp.getId()+"</td>");
      out.print("<td>"+stuTmp.getSequence()+"</td>");
      out.print("<td>"+stuTmp.getName()+"</td>");
      out.print("<td>"+stuTmp.getSex()+"</td>");
      out.print("<td>"+stuTmp.getBirthday()+"</td>");
      out.print("<td>"+stuTmp.getCard()+"</td>");
      out.print("<td>"+stuTmp.getPolitical()+"</td>");
      out.print("<td>"+stuTmp.getNation()+"</td>");
      out.print("<td>"+stuTmp.getNativePlace()+"</td>");
      out.print("<td>"+stuTmp.getClassName()+"</td>");
      out.print("</tr>");
    }
    out.print("</table>");
    %>
  </body>
</html>
