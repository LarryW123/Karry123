package case741.Action.Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case741.POJO.JsonResultSet;
import case741.POJO.Users;
import case741.ServiceDAO.UsersServiceDAOimpl;
import case741.Util.*;

public class Login extends HttpServlet {

  private static final long serialVersionUID = 1L;
  UsersServiceDAOimpl usersSD = new UsersServiceDAOimpl();
  Users users = new Users();
  
  public Login() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    //1.(参)获取参数值，并保存到POJO对象
    String sequence = request.getParameter("sequence");
    String password = request.getParameter("password");
    Util util = new Util();
    try {
	  password = util.EncoderByMd5(password);
	} catch (NoSuchAlgorithmException e) {
	  e.printStackTrace();
	}
    if (sequence != null && sequence.length() > 0 && password != null && password.length() > 0){
      users.setCondition(" sequence = '"+sequence+"' and password ='"+password+"'");
    }else{
      out.print("{\"success\":false,\"msg\":\"账号密码不完整！\"}");
      return;
    }
    //2.(调)调用ServiceDAO的方法，完成对应业务
    JsonResultSet JsonResultSet = usersSD.checkUser(users);
    //3.(存)将数据对象存储到request作用范围变量
    request.setAttribute("JsonResultSet", JsonResultSet);
    //4.(转)将业务转发到View
    RequestDispatcher rd = request.getRequestDispatcher("/toLogin");
    rd.forward(request, response);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
