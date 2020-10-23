package ex31;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex311 extends HttpServlet {
	
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
    
    int s=0;
    for(int i=0;i<=100;i++){
      s+=i;
    }
    out.println(s);
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}