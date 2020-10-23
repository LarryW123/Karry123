package case751;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class logOut extends HttpServlet {
  
  private static final long serialVersionUID = 1L;

  public void destroy() {
    super.destroy(); 
  }

  public void init() throws ServletException {
    
  }
  
  public void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();  
    request.getSession().invalidate();
    out.close();
  }
}
