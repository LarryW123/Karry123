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
    <title>随机数判断</title>
  </head>
  
  <body>
    <%! int count=0; %>
    <%
	HttpSession se=request.getSession();
	String strRnd=se.getAttribute("rnd").toString();
    String strNum=request.getParameter("num");
	if(strNum!=null && strNum.length()!=0){
      int rnd=Integer.parseInt(strRnd);
      int num=Integer.parseInt(strNum);
      if(num<rnd){
        out.println("小了");
        count++;
      }
      else if(num>rnd){
        out.println("大了");
        count++;
      }
      else{
        count++;
        se.setAttribute("result", count);
        response.sendRedirect("result.jsp");
	}
  }
   %>
  <form>
    <label>请输入要猜的数:</label><input type="text" name="num"/>
    <input type="submit"/>
  </form>
  </body>
</html>
