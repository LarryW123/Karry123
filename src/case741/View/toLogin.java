package case741.View;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
//import com.alibaba.fastjson.JSON;

public class toLogin extends HttpServlet {
	
  private static final long serialVersionUID = 1L;
  
  public toLogin() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    Object JsonResultSet = request.getAttribute("JsonResultSet");
    JSONObject msg = JSONObject.fromObject(JsonResultSet);
    //对msg中的数据进行判断
    if(msg.getInt("total") == 0){
      out.print("{\"success\":false,\"msg\":\"账号或密码错误！\"}");
    }else if(msg.getInt("total") > 1){
      out.print("{\"success\":false,\"msg\":\"该用户存在多个！请联系管理员核实！\"}");
    }else{
      JSONArray rows = (JSONArray) msg.get("rows");
      JSONObject row = (JSONObject) rows.get(0);
      int id =  row.getInt("id");
      int userId =  row.getInt("userId");
      String sequence =  row.getString("sequence");
      String nickName =  row.getString("nickName");
      String password =  row.getString("password");
      String role =  row.getString("role");
      String imgURL =  row.getString("imgURL");
      //将登录信息保存到session
      HttpSession session = request.getSession();
      session.setAttribute("id", id);
      session.setAttribute("userId", userId);
      session.setAttribute("sequence", sequence);
      session.setAttribute("nickName", nickName);
      session.setAttribute("password", password);
      session.setAttribute("role", role);
      session.setAttribute("imgURL", imgURL);

      out.print("{\"success\":true,\"msg\":\"账号和密码正确！\"}");
    }
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
