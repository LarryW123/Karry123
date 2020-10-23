package case741.View;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
//import com.alibaba.fastjson.JSON;

public class toJSON extends HttpServlet {
	
  private static final long serialVersionUID = 1L;
  
  public toJSON() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    Object JsonResultSet = request.getAttribute("JsonResultSet");
    JSONObject msg = JSONObject.fromObject(JsonResultSet);//转换成JSON对象
    //JSONArray msg = JSONArray.fromObject(JsonResultSet);//转换成JSON数组
    //Student student = JSON.parseObject(jsonString,Student.class);
    out.print(msg);
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
