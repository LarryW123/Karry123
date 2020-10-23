<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用URL重写实现Session追踪</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form>   
        <label>账号：</label><input type="text" name="userName"><br/><br/>
        <label>密码：</label><input type="password" name="pw"><br/><br/>
        <input type="submit" value="登录">
    </form>
    <%
    String name=request.getParameter("userName");
    String pw=request.getParameter("pw");
    
    if((name!=null&&name.length()!=0)&&(pw!=null&&pw.length()!=0)){
      if(name.equals("admin")&&pw.equals("123")){
        response.sendRedirect("mainURL.jsp?name=admin");
      }
      else{
        out.print("登录失败");
      }
    }
    else{
      out.print("未登录");
    }
    %>
  </body>
</html>
