package ex33;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex331 extends HttpServlet {
  
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
    out.println("<HTML>");
    out.println("<HEAD><TITLE>ex311</TITLE></HEAD>");
    out.println("<BODY>");
    
    Date date = new Date();
    int hour = date.getHours();
    String str = null;
    if(hour<5){str="凌晨";}
    else if(hour<8){str="清晨";}
    else if(hour<12){str="上午";}
    else if(hour<14){str="中午";}
    else if(hour<18){str="下午";}
    else if(hour<20){str="傍晚";}
    else {str="晚上";}
    out.println(date.toString()+"现在是"+str);
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}
