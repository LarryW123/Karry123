<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用Session对象实现Session追踪</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  
  <body>
    <form>   
        <label>账号：</label><input type="text" name="userName"><br/><br/>
        <label>密码：</label><input type="password" name="pw"><br/><br/>
        <input type="submit" value="登录">
    </form>
    <%
    HttpSession se = request.getSession();
    String name=request.getParameter("userName");
    String pw=request.getParameter("pw");
    if((name!=null&&name.length()!=0)&&(pw!=null&&pw.length()!=0)){
      if(name.equals("admin")&&pw.equals("123")){
        se.setAttribute("name","admin");
        response.sendRedirect("mainSession.jsp");
        //为了防止某些浏览器不支持或禁用Cookie而导致session跟踪失败
        //可以使用下面两种方法，对重定向URL进行编码
        //将用户的session追加到网址的末尾
        //从而保证用户在不同的页面时的session对象是一致的
        //response.sendRedirect(response.encodeURL("mainSession.jsp"));
        //方法一是本应用级别的，如果在同一应用中，可以这样做
        //response.sendRedirect(response.encodeRedirectURL("mainSession.jsp"));
        //方法二是跨应用的级别的，如果在不同应用中，可以这样做
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
