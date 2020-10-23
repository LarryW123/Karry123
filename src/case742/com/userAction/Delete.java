package case742.com.userAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case742.com.pojo.User;
import case742.com.serviceDAO.UserServiceDAOimpl;

public class Delete extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }
    
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    //1.初始化
    int id;
    boolean success;
    String msg = null;  
    //2.获取参数
    request.setCharacterEncoding("utf-8");
    id = Integer.parseInt(request.getParameter("id"));
    //3.封装到pojo对象
    User user = new User();
    user.setId(id);
    //4.调用删除业务
    UserServiceDAOimpl userSD = new UserServiceDAOimpl();
    if(userSD.delete(user)){
      success = true;
      msg = "删除成功";
    }else{
      success = false;
      msg = "删除失败";
    }
    //5.拼接结果，响应给客户端
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    String datas = "{\"success\":\""+success+"\",\"msg\":\""+msg+"\"}";
    out.print(datas);
  }
}
