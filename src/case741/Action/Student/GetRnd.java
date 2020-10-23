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

/**
 * Servlet implementation class GetRnd
 */
public class GetRnd extends HttpServlet {
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
    //1.(参)获取参数值：按页面需求，分页条件和排序条件在DAO层写死，没必要找麻烦
    //2.(调)调用ServiceDAO的方法，完成对应业务
    JsonResultSet JsonResultSet = studentSD.selectRnd(student);
    //3.(存)将数据对象存储到request作用范围变量
    request.setAttribute("JsonResultSet", JsonResultSet);
    //4.(转)将业务转发到View
    RequestDispatcher rd = request.getRequestDispatcher("/toJSON");
    rd.forward(request, response);
  }
}
