package ex32;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex321 extends HttpServlet {
  
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
    
    String txt = request.getParameter("txt");
    if(txt == null || txt.length()==0){
    	out.print("0");
    }
    else{
      Integer max = Integer.parseInt(txt);
      int s=0;
      for(int i=0;i<=max;i++){
        s+=i;
      }
      out.print("1+2+3+...+"+max+"="+s);
    }
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}
