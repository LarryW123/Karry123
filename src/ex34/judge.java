package ex34;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class judge extends HttpServlet {
  
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      //解决post乱码
      request.setCharacterEncoding("utf-8");
      String userName = request.getParameter("userName");
      String password = request.getParameter("password");
      //解决get乱码
      //String userName = new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");
      //String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"utf-8");
      RequestDispatcher rd;
      if(userName.equals("张三") && password.equals("123456")){
        request.setAttribute("userName",userName);
        request.setAttribute("password",password);
        rd = request.getRequestDispatcher("/ex/ex3-4/main.jsp");
      }
      else{
        rd = request.getRequestDispatcher("/ex/ex3-4/login.jsp");
      }
      rd.forward(request, response); 
  }
}
