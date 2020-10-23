package case741.Action.Student;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case741.POJO.JsonResultSet;
import case741.POJO.Student;
import case741.ServiceDAO.StudentServiceDAOimpl;

public class Get extends HttpServlet {
  private static final long serialVersionUID = 1L;
  StudentServiceDAOimpl studentSD = new StudentServiceDAOimpl();
  Student student = new Student();

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    //初始化
    request.setCharacterEncoding("utf-8");
    //1.(参)获取参数值，并保存到POJO对象
    //查询条件
    String search = request.getParameter("search");
    if (search != null && search.length() > 0){
      student.setCondition(" name like '%"+search+"%'");
    }else{
      student.setCondition("");
    }
    //分页条件
    String offset = request.getParameter("offset");//开始
    String limit = request.getParameter("limit");
    if (offset != null && offset.length() > 0){
      student.setLimit(" limit "+offset+","+limit);
    }else{
      student.setLimit("");
    }
    //排序条件
    String sort = request.getParameter("sort");//排序字段
    String order = request.getParameter("order");//排序方式
    if (sort != null && sort.length() > 0){
      student.setOrderBy(" order by "+sort+" "+order);
    }else{
      student.setOrderBy("");
    }
    //2.(调)调用ServiceDAO的方法，完成对应业务
    JsonResultSet JsonResultSet = studentSD.selectByPage(student);
    //3.(存)将数据对象存储到request作用范围变量
    request.setAttribute("JsonResultSet", JsonResultSet);
    //4.(转)将业务转发到View
    RequestDispatcher rd = request.getRequestDispatcher("/toJSON");
    rd.forward(request, response);
  }
}