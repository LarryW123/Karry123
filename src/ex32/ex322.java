package ex32;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex322 extends HttpServlet {
  
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
    
    String str = "";
    String s[] = request.getParameterValues("like");
    for(int i=0;i<s.length;i++){
      str += s[i]+",";
    }
    out.print("你选择的是"+str);
    
    out.println("</BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }
}
