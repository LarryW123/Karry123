package case741.Action.Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case741.POJO.Users;
import case741.ServiceDAO.UsersServiceDAOimpl;
import case741.Util.Util;

public class ResetPwd extends HttpServlet {
	  
  private static final long serialVersionUID = 1L;
  UsersServiceDAOimpl usersSD = new UsersServiceDAOimpl();
  Users users = new Users();
  
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    //1.(参)获取参数，验证后保存到POJO对象
    String id = request.getParameter("id");
    Util util = new Util();
    try {
      String newPwd = util.EncoderByMd5("123456");
      users.setPassword(newPwd);
	} catch (NoSuchAlgorithmException e) {
	  e.printStackTrace();
	}
    users.setId(Integer.parseInt(id));
    //2.(调)调用ServiceDAO的方法，完成对应业务
    boolean result = usersSD.updatePassword(users);
    //3.返回简单的数据即可，就不麻烦view了
    if(result){
      out.print("密码重置为123456");
    }else{
      out.print("密码重置失败");
    }
  }

}
