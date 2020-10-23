package case751;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class CountListener implements HttpSessionListener {
	
  public void sessionCreated(HttpSessionEvent se) {
    System.out.println("用户已上线...");
    ServletContext sc = se.getSession().getServletContext();
    Integer count = (Integer)sc.getAttribute("count");
    if(count == null){count = 1;}
    else{count++;}
    sc.setAttribute("count",count);
  }

  public void sessionDestroyed(HttpSessionEvent se) {
    System.out.println("用户已退出...");
    ServletContext sc = se.getSession().getServletContext();
    Integer count = (Integer)sc.getAttribute("count");
    count--;
    sc.setAttribute("count",count);      
  }

}
