package case742.com.userAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case742.com.pojo.JsonRS;
import case742.com.pojo.User;
import case742.com.serviceDAO.UserServiceDAOimpl;
import net.sf.json.JSONObject;

public class Get extends HttpServlet {
  private static final long serialVersionUID = 1L;
  UserServiceDAOimpl userSD = new UserServiceDAOimpl();
  User user = new User();

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    //查询条件
    String condition = request.getParameter("condition");
    if (condition != null && condition.length() > 0){
    	user.setCondition("name like '%"+condition+"%'");
    }else{
    	user.setCondition("");
    }
    //分页条件
    String pages = request.getParameter("page");
    String rows = request.getParameter("rows");
    if (pages != null && pages.length() > 0 && rows != null && rows.length() > 0){
    	int page = Integer.parseInt(pages);
    	int row = Integer.parseInt(rows);
    	user.setLimit(" limit "+(page-1)*row+","+row);
    }else{
    	user.setLimit("");
    }
    //执行查询，返回结果
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    JsonRS JsonRS = userSD.selectByPage(user);
    JSONObject userMsg = JSONObject.fromObject(JsonRS);
    out.print(userMsg); 
  }
}
