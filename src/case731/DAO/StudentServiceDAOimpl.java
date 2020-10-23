package case731.DAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import case731.DAO.Student;
import case731.DAO.DButil;

public class StudentServiceDAOimpl implements StudentServiceDAO{
  /*查询业务*/
  public ArrayList<Student> select(Student student) {
    Connection conn = DButil.getConnection();
    StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      ArrayList<Student> studentList = new ArrayList<Student>();
      studentList = studentD.select(student);
      conn.commit();
      return studentList;
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
  
  /*添加业务*/
  public boolean insert(Student student){
	Connection conn = DButil.getConnection();
	StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      studentD.insert(student);
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
  /*更新业务*/
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
  
  /*删除业务*/
  public boolean delete(Student student){
	Connection conn = DButil.getConnection();
	StudentDAOimpl studentD = new StudentDAOimpl(conn);
    try{
      studentD.delete(student);
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