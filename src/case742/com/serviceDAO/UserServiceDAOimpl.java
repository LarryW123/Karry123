package case742.com.serviceDAO;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import case742.com.DAO.UserDAOimpl;
import case742.com.pojo.JsonRS;
import case742.com.pojo.User;
import case742.com.util.DButil;

public class UserServiceDAOimpl implements UserServiceDAO{
  /*查询业务*/
  public JsonRS selectByPage(User user) {
    Connection conn = DButil.getConnection();
    UserDAOimpl userD = new UserDAOimpl(conn);
    try{
      ArrayList<User> userList = new ArrayList<User>();
      int total = userD.count(user);//获取记录数
      userList = userD.select(user);//返回记录集
      conn.commit();
      JsonRS JsonRS = new JsonRS(total,userList);
      return JsonRS;
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
  public boolean insert(User user){
	Connection conn = DButil.getConnection();
	UserDAOimpl userD = new UserDAOimpl(conn);
    try{
      userD.insert(user);
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
  public boolean update(User user){
	Connection conn = DButil.getConnection();
	UserDAOimpl userD = new UserDAOimpl(conn);
    try{
      userD.update(user);
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
  public boolean delete(User user){
	Connection conn = DButil.getConnection();
	UserDAOimpl userD = new UserDAOimpl(conn);
    try{
      userD.delete(user);
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