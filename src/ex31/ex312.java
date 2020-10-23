package ex31;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex312 extends HttpServlet {
	
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
    out.println("<HEAD><TITLE>ex312</TITLE></HEAD>");
    out.println("<BODY>");
    
    String h=request.getParameter("h");
    String w=request.getParameter("w");
    if(h==null || h.length()==0 || w==null || w.length()==0){
      out.println("没有参数");
    }
    else{
      double h1=Double.parseDouble(h);
      double w1=Double.parseDouble(w);
      double bmi=h1/w1;
      out.println("height="+h1+"<br>");
      out.println("weight="+w+"<br>");
      out.println("bmi="+bmi);
    }
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}
