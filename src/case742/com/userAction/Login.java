package case742.com.userAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import case742.com.pojo.JsonRS;
import case742.com.pojo.User;
import case742.com.serviceDAO.UserServiceDAOimpl;

public class Login extends HttpServlet {
  
  private static final long serialVersionUID = 1L;
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    //查询条件
    UserServiceDAOimpl userSD = new UserServiceDAOimpl();
    User user = new User();
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String condition = "phone='"+userName+"' and password='"+password+"'";
    condition += " or email='"+userName+"' and password='"+password+"'";
    condition += " or qq='"+userName+"' and password='"+password+"'";
    user.setCondition(condition);
    //执行查询，返回结果
    PrintWriter out = response.getWriter();
    JsonRS JsonRS = userSD.selectByPage(user);
    if(JsonRS.getRows().isEmpty()){
      out.print("用户名或密码错误");
    }else{
      JSONArray jarr = JSONArray.fromObject(JsonRS.getRows());
      JSONObject job = jarr.getJSONObject(0);
      HttpSession session = request.getSession();
      session.setAttribute("userId",job.get("userId"));
      session.setAttribute("name",job.get("name"));
      session.setAttribute("role",job.get("role"));
      out.print(session.getAttribute("role"));
    }
  }

}
