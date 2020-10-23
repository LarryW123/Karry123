package case711;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class display extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
    out.println("<HTML>");
    out.println("  <HEAD><TITLE>封装表单数据</TITLE></HEAD>");
    out.println("  <BODY>");
    RegForm rf = new RegForm();
    //数据封装
    rf.setUserName(request.getParameter("userName")); 
    rf.setPassword(request.getParameter("password")); 
    rf.setSex(request.getParameter("sex")); 
    rf.setMemo(request.getParameter("memo")); 
    try{
      rf.setHobby(request.getParameterValues("hobby"));
    }catch (Exception e){
      out.println(e);
    }
  //数据显示
    out.println("账号："+rf.getUserName()+"<br/>");
    out.println("密码："+rf.getPassword()+"<br/>");
    out.println("性别："+rf.getSex()+"<br/>");
    out.println("爱好："+Arrays.toString(rf.getHobby())+"<br/>");
    out.println("备注号："+rf.getMemo()+"<br/>");
    
    out.println("  </BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}