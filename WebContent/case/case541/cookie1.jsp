<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie,java.net.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>测试界面一</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <%
      Cookie co[] = request.getCookies();//添加属性
      
      for(int i=0;i<co.length;i++){//遍历cookie对象
        String name = co[i].getName(); //获得cookie名称
        String value = co[i].getValue();//获得cookie值
        out.print(name+"："+URLDecoder.decode(value)+"<br/>");//解码后输出
      }

      String str = URLEncoder.encode("信息A1611");//对原字符串进行编码
      co[2] = new Cookie("className",str);//添加新属性
      response.addCookie(co[2]);//继续添加到cookie
     %>
    <form action="case/case541/cookie2.jsp" method="post">
      <input type="submit"/>
    </form>
  </body>
</html>
