package case741.ServiceDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import case741.DAO.UsersDAOimpl;
import case741.POJO.JsonResultSet;
import case741.POJO.Users;
import case741.Util.DButil;

public class UsersServiceDAOimpl implements UsersServiceDAO{
  /**
   * 账号验证业务
   */
  public JsonResultSet checkUser(Users users) {
    Connection conn = DButil.getConnection();
    UsersDAOimpl UserD = new UsersDAOimpl(conn);
    try{
      ArrayList<Users> UserList = new ArrayList<Users>();
      UserList = UserD.select(users);//返回记录集
      int total = UserD.count(users);//获取记录数
      boolean success = true;//操作成功与否
      String msg = "查询成功";//返回的结果信息
      conn.commit();
      JsonResultSet JsonResultSet = new JsonResultSet(success,msg,total,UserList);
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
  public boolean insert(Users users){
	Connection conn = DButil.getConnection();
	UsersDAOimpl UserD = new UsersDAOimpl(conn);
    try{
      UserD.insert(users);
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
   * 更新密码业务
   */
  public boolean updatePassword(Users users){
	Connection conn = DButil.getConnection();
	UsersDAOimpl UserD = new UsersDAOimpl(conn);
    try{
      UserD.updatePart(users);
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
  public boolean delete(Users users){
	Connection conn = DButil.getConnection();
	UsersDAOimpl UserD = new UsersDAOimpl(conn);
    try{
      UserD.delete(users);
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