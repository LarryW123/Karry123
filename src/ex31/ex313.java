package ex31;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex313 extends HttpServlet {
	
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
    out.println("<HEAD><TITLE>ex313</TITLE></HEAD>");
    out.println("<BODY>");

    String s=request.getParameter("h");
    if(s==null || s.length()==0){
      out.println("没有参数");
    }
    else{
      double h=Double.parseDouble(s);
      for (int i=0;i<h;i++){
        out.print("Hello World !"+"<br>");
      }
    }
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}
