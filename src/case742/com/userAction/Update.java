package case742.com.userAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case742.com.pojo.User;
import case742.com.serviceDAO.UserServiceDAOimpl;

public class Update extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }
    
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    //1.初始化
    int id;
    String userId = null;
    String name = null;
    String password = null;
    int role;
    String qq = null;
    String email = null;
    String phone = null;
    String address = null;
    boolean success;
    String msg = null;
    //2.获取参数
    request.setCharacterEncoding("utf-8");
    id = Integer.parseInt(request.getParameter("id"));
    userId = request.getParameter("userId");
    name = request.getParameter("name");
    password = request.getParameter("password");
    role = Integer.parseInt(request.getParameter("role"));
    qq = request.getParameter("qq");
    email = request.getParameter("email");
    phone = request.getParameter("phone");
    address = request.getParameter("address");
    //3.封装到pojo对象
    User user = new User();
    user.setId(id);
    user.setUserId(userId);
    user.setName(name);
    user.setPassword(password);
    user.setRole(role);
    user.setQq(qq);
    user.setEmail(email);
    user.setPhone(phone);
    user.setAddress(address);
    //4.调用删除业务
    UserServiceDAOimpl userSD = new UserServiceDAOimpl();
    if(userSD.update(user)){
      success = true;
       msg = "修改成功";
    }else{
      success = false;
      msg = "修改失败";
    }
    //5.拼接结果，响应给客户端
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    String datas = "{\"success\":\""+success+"\",\"msg\":\""+msg+"\"}";
    out.print(datas);
  }
}
