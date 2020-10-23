package case741.ServiceDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import case741.DAO.StudentDAOimpl;
import case741.DAO.UsersDAOimpl;
import case741.POJO.JsonResultSet;
import case741.POJO.Student;
import case741.POJO.Users;
import case741.Util.DButil;
import case741.Util.Util;

public class StudentServiceDAOimpl implements StudentServiceDAO{
  /**
   * 查询业务
   * 此处做3件事：
   * 1、调用DAO层的select方法，返回查询到的记录集
   * 2、调用DAO层的count方法，返回查询到的记录数
   * 3、利用JsonResultSet将记录数total与记录集studentList拼接成“total=50,rows=[{},{}...{}]”格式
   */
  public JsonResultSet selectByPage(Student student) {
    Connection conn = DButil.getConnection();
    StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      ArrayList<Student> studentList = new ArrayList<Student>();
      studentList = studentD.select(student);//返回记录集
      int total = studentD.count(student);//获取记录数
      boolean success = true;//操作成功与否
      String msg = "查询成功";//返回的结果信息
      conn.commit();
      JsonResultSet JsonResultSet = new JsonResultSet(success,msg,total,studentList);
      return JsonResultSet;
    }catch(Exception e){
      try {
        conn.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      return null;
    }finally{
      if(conn != null){
        DButil.closeConnection(conn);
      }
    }
  }
  
  /**
   * 查询随机记录业务
   */
  public JsonResultSet selectRnd(Student student) {
    Connection conn = DButil.getConnection();
    StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      ArrayList<Student> studentList = new ArrayList<Student>();
      studentList = studentD.selectRnd(student);//返回记录集
      int total = studentD.count(student);//获取记录数
      boolean success = true;//操作成功与否
      String msg = "查询成功";//返回的结果信息
      conn.commit();
      JsonResultSet JsonResultSet = new JsonResultSet(success,msg,total,studentList);
      return JsonResultSet;
    }catch(Exception e){
      try {
        conn.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      return null;
    }finally{
      if(conn != null){
        DButil.closeConnection(conn);
      }
    }
  }
  
  /**
   * 添加业务
   */
  public boolean insert(Student student){
  Connection conn = DButil.getConnection();
  StudentDAOimpl studentD = new StudentDAOimpl(conn);
    UsersDAOimpl usersD = new UsersDAOimpl(conn);
    try{
      int userId = studentD.insert(student);//添加学生
      Users users = new Users();
      users.setUserId(userId);
      users.setSequence(student.getSequence());
      users.setNickName(student.getName());
      Util util = new Util();
      String pw = util.EncoderByMd5("123456");
      users.setPassword(pw);
      users.setRole("学生");
      users.setImgURL("user-default.png");
      usersD.insert(users);//添加对应的登录用户
      conn.commit();
      return true;
    }catch(Exception e){
      try {
        conn.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      return false;
    }finally{
      if(conn != null){
      DButil.closeConnection(conn);
      }
    }
  }

  /**
   * 更新业务
   */
  public boolean update(Student student){
  Connection conn = DButil.getConnection();
  StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      studentD.update(student);
      conn.commit();
      return true;
    }catch(Exception e){
      try {
        conn.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      return false;
    }finally{
      if(conn != null){
      DButil.closeConnection(conn);
      }
    }
  }
  
  /**
   * 删除业务
   */
  public boolean delete(Student student){
  Connection conn = DButil.getConnection();
  StudentDAOimpl studentD = new StudentDAOimpl(conn);
    UsersDAOimpl usersD = new UsersDAOimpl(conn);
    try{
      studentD.delete(student);//删除student表中指定id的记录
      int userId = student.getId();
      Users users = new Users();
      users.setUserId(userId);
      usersD.deleteByUserId(users);//删除user表中对应UserId的记录
      conn.commit();
      return true;
    }catch(Exception e){
      try {
        conn.rollback();
      } catch (SQLException e1) {
        e1.printStackTrace();
      }
      return false;
    }finally{
      if(conn != null){
        DButil.closeConnection(conn);
      }
    }
  }
}