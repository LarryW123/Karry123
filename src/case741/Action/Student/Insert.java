package case741.Action.Student;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case741.POJO.JsonResultSet;
import case741.POJO.Student;
import case741.ServiceDAO.StudentServiceDAOimpl;

public class Insert extends HttpServlet {
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
    String sequence = request.getParameter("sequence");
    String name = request.getParameter("name");
    if(name == ""){name = null;}
    String sex = request.getParameter("sex");
    if(sex == ""){sex = null;}
    String political = request.getParameter("political");
    if(political == ""){political = null;}
    String nation = request.getParameter("nation");
    if(nation == ""){nation = null;}
    String birthday = request.getParameter("birthday");
    if(birthday == ""){birthday = null;}
    String card = request.getParameter("card");
    if(card == ""){card = null;}
    String nativePlace = request.getParameter("nativePlace");
    if(nativePlace == ""){nativePlace = null;}
    String className = request.getParameter("className");
    if(className == ""){className = null;}
    
    student.setSequence(sequence);
    student.setName(name);
    student.setSex(sex);
    student.setPolitical(political);
    student.setNation(nation);
    student.setBirthday(birthday);
    student.setCard(card);
    student.setNativePlace(nativePlace);
    student.setClassName(className);
    //2.(调)调用ServiceDAO的方法，完成对应业务
    studentSD.insert(student);
    JsonResultSet JsonResultSet = studentSD.selectByPage(student);
    //3.(存)将数据对象存储到request作用范围变量
    request.setAttribute("JsonResultSet", JsonResultSet);
    //4.(转)将业务转发到View
    RequestDispatcher rd = request.getRequestDispatcher("/toJSON");
    rd.forward(request, response);
  }
}
