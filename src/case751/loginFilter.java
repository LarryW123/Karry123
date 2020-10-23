package case751;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class loginFilter implements Filter{
  
  public void init(FilterConfig filterConfig) throws ServletException{
    
  }

  public void doFilter(ServletRequest request, ServletResponse response,
      FilterChain filterChain) throws IOException, ServletException {
    try{
      request.setCharacterEncoding("utf-8");//统一字符编码格式
      String name = request.getParameter("userName");
      if(name==null ||name.length()==0){
        ((HttpServletResponse)response).sendRedirect("error.jsp");          
      }else{
        HttpSession se = ((HttpServletRequest)request).getSession();
        se.setAttribute("userName", name);
        filterChain.doFilter(request, response);          
      }
    }
    catch(ServletException e){System.out.print("执行Servlet异常:"+e);}
    catch(IOException io){System.out.print("输出异常:"+io);}
  }

  public void destroy() {
    
  }

}