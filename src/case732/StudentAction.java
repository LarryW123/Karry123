package case732;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import case732.Student;
import case732.StudentServiceDAOimpl;

public class StudentAction extends HttpServlet {
  private static final long serialVersionUID = 1L;
  StudentServiceDAOimpl studentSD = new StudentServiceDAOimpl();
  Student student = new Student();

  public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    doPost(request, response);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    int id;
    String sequence = null;
    String name = null;
    String sex = null;
    String polotical = null;
    String nation = null;
    String birthday = null;
    String card = null;
    String nativePlace = null;
    String className = null;
    
    request.setCharacterEncoding("utf-8");
    String sbmBtn=null;
    int value = 1;
    sbmBtn = request.getParameter("sbmBtn");
    if(sbmBtn!=null){
      if(sbmBtn.equals("查询")){value = 1;}
      if(sbmBtn.equals("添加")){value = 2;}
      if(sbmBtn.equals("修改")){value = 3;}
      if(sbmBtn.equals("删除")){value = 4;}
    }
    
    switch (value){
      case 1://查询
        String type = request.getParameter("type");
        String judge = request.getParameter("judge");
        String condition = request.getParameter("condition");
        String sqlStr = type+judge+"'"+condition+"'";
        if (condition != null && condition.length() > 0){
          student.setCondition(sqlStr);
        }
        break;
      case 2://添加
        sequence = request.getParameter("sequence");
        name = request.getParameter("name");
        sex = request.getParameter("sex");
        polotical = request.getParameter("political");
        nation = request.getParameter("nation");
        birthday = request.getParameter("birthday");
        if(birthday==""){birthday=null;}//注意对日历控件的处理
        card = request.getParameter("card");
        nativePlace = request.getParameter("nativePlace");
        className = request.getParameter("className");
        student.setSequence(sequence);
        student.setName(name);
        student.setSex(sex);
        student.setPolitical(polotical);
        student.setNation(nation);
        student.setBirthday(birthday);
        student.setCard(card);
        student.setNativePlace(nativePlace);
        student.setClassName(className);
        studentSD.insert(student);
        break;
      case 3://修改
        id = Integer.parseInt(request.getParameter("id"));
        sequence = request.getParameter("sequence");
        name = request.getParameter("name");
        sex = request.getParameter("sex");
        polotical = request.getParameter("political");
        nation = request.getParameter("nation");
        birthday = request.getParameter("birthday");
        if(birthday==""){birthday=null;}
        card = request.getParameter("card");
        nativePlace = request.getParameter("nativePlace");
        className = request.getParameter("className");
        student.setId(id);
        student.setSequence(sequence);
        student.setName(name);
        student.setSex(sex);
        student.setPolitical(polotical);
        student.setNation(nation);
        student.setBirthday(birthday);
        student.setCard(card);
        student.setNativePlace(nativePlace);
        student.setClassName(className);
        studentSD.update(student);
        break;
      case 4://删除
        id = Integer.parseInt(request.getParameter("id"));
        student.setId(id);
        studentSD.delete(student);
        break;
        default:
        break;
    }
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    ArrayList<Student> studentList = studentSD.select(student);
    //转发
    request.setAttribute("stuList",studentList);
    RequestDispatcher rd= request.getRequestDispatcher("/case/case732/studentView.jsp");
    rd.forward(request, response); 
  }

}
