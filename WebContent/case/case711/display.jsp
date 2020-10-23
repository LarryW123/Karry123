<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>封装表单数据</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>

  <body>
    <jsp:useBean id="reg" class="case711.RegForm" scope="page"/>
    <jsp:setProperty name="reg" property="*"/>
    <br>账号：<jsp:getProperty name="reg" property="userName"/>
    <br>密码：<jsp:getProperty name="reg" property="password"/>
    <br>性别：<jsp:getProperty name="reg" property="sex"/>
    <br>爱好：
    <%
      String hobby[]=reg.getHobby();
      if(hobby!=null){
        for(int i=0;i<hobby.length;i++){
          out.print(hobby[i]+";");
        }
      }
    %>
    <br>备注：<jsp:getProperty name="reg" property="memo"/>
  </body>
</html>
