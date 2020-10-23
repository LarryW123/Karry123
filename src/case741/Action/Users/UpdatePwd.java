package case741.Action.Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import case741.POJO.Users;
import case741.ServiceDAO.UsersServiceDAOimpl;
import case741.Util.Util;

public class UpdatePwd extends HttpServlet {
  
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
    HttpSession session = request.getSession();
    String id = session.getAttribute("id").toString();//获取session中的用户id
    String pw = session.getAttribute("password").toString();//获取session中的原始密码
    
    String newPwd = request.getParameter("newPwd");//新密码
    String oldPwd = request.getParameter("oldPwd");//用户输入的旧密码，需要与原始密码匹配
    Util util = new Util();
    try {
    	oldPwd = util.EncoderByMd5(oldPwd);
    	newPwd = util.EncoderByMd5(newPwd);
	} catch (NoSuchAlgorithmException e) {
	  e.printStackTrace();
	}
    if(!oldPwd.equals(pw)){
      out.print("原始密码错误");
      return;
    }
    users.setId(Integer.parseInt(id));
    users.setPassword(newPwd);
    //2.(调)调用ServiceDAO的方法，完成对应业务
    boolean result = usersSD.updatePassword(users);
    //3.返回简单的数据即可，就不麻烦view了
    if(result){
      out.print("密码修改成功");
    }else{
      out.print("密码修改失败");
    }
  }

}
