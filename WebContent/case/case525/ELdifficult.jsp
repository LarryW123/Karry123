<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="case526.*,javax.servlet.http.HttpSession"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>EL其他运算符</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <!-- 其他运算符：.和[]-->
    ------------------------------------
  <%
    //1、读取Session
    HttpSession se = request.getSession();
    se.setAttribute("userName","tom");
    se.setAttribute("password","123456");
  %>
    <br/>读取Session：<br/>
    <br/>运算 se["userName"] 的结果：${userName}
    <br/>运算 se.password 的结果：${password}<br/>
    ------------------------------------
  <%
    //2、读取object
  	Student obj = new Student();
    obj.setName("jerry");
    obj.setSex("男");
    se.setAttribute("obj", obj);
  %>
    <br/>读取object：<br/>
    <br/>运算 obj["name"] 的结果：${obj["name"]}
    <br/>运算 obj.sex 的结果：${obj.sex}<br/>
    ------------------------------------
  <%
    //3、读取array
    String arr[] = {"2000-1-1","汉族"};
    se.setAttribute("arr", arr);
  %>
    <br/>读取array：<br/>
    <br/>运算arr[0] 的结果：${arr[0]}
    <br/>运算 arr[1] 的结果：${arr[1]}<br/>
    ------------------------------------
  <%
    //4、读取list
    List<String> lst = new ArrayList<String>();
    lst.add("江西九江");
    lst.add("党员");
    se.setAttribute("lst",lst);
  %>
    <br/>读取list：<br/>
    <br/>运算lst[0] 的结果：${lst[0]}
    <br/>运算 lst[1] 的结果：${lst[1]}<br/>
    ------------------------------------
  <%
    //5、读取map
    Map<String,Object> map = new HashMap<String,Object>();
    map.put("className","信息A1011");
    map.put("phone","13907921234");
    se.setAttribute("map",map);
  %>
    <br/>读取map：<br/>
    <br/>运算 map["className"] 的结果：${map["className"]}
    <br/>运算 map.phone 的结果：${map.phone}<br/>
    ------------------------------------
  <!-- 其他运算符：empty -->
    <br/>empty运算 empty obj 的结果：${empty obj}<br/>
    <br/>empty运算 empty array 的结果：${empty arr}<br/>
    <br/>empty运算 empty list 的结果：${empty lst}<br/>
    <br/>empty运算 empty map 的结果：${empty map}<br/>
    <%-- 若要判断session对象是否存在，不是用${empty se} --%>
    <%-- 而是要判断其中的某个key，比如${empty userName} --%>
    <br/>empty运算 empty session 的结果：${empty userName}<br/>
    <br/>empty运算 empty session 的结果：${empty QQ}<br/>
     ------------------------------------
  </body>
</html>
