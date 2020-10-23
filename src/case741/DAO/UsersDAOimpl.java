package case741.DAO;

import java.sql.*;
import java.util.ArrayList;
import case741.POJO.Users;

public class UsersDAOimpl implements UsersDAO {
  private Connection conn = null;
  private PreparedStatement pst = null;

  public UsersDAOimpl(Connection conn) {
    super();
    this.conn = conn;
  }
  
  /**
   * 用于登录的查询验证
   */
  public ArrayList<Users> select(Users users) throws SQLException {
    String sql = "select id,userId,sequence,nickName,"
    		   + "password,role,imgURL "
    		   + "from user where 1=1 ";
    //查询
    String condition = users.getCondition();
    if(condition != null && ! condition.equals("")){
      sql += " and " + condition;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    ArrayList<Users> UserList = new ArrayList<Users>();
    if(rs.next()){
      for(int i=0;i<=rs.getRow();i++){
        Users temp = new Users();
        temp.setId(rs.getInt("id"));
        temp.setUserId(rs.getInt("userId"));
        temp.setSequence(rs.getString("sequence"));
        temp.setNickName(rs.getString("nickName"));
        temp.setPassword(rs.getString("password"));
        temp.setRole(rs.getString("role"));
        temp.setImgURL(rs.getString("imgURL"));
        UserList.add(temp);
        rs.next();
      }
    }
    return UserList;
  }
  
  /**
   * 统计记录
   */
  public int count(Users users) throws SQLException {
    String sql = "select count(*) as cnt from user where 1=1";
    String condition = users.getCondition();
    if(condition!=null && !condition.equals("")){
      sql += " and " + condition;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    rs.next();
    int cnt = Integer.parseInt(rs.getString("cnt"));
    return cnt;
  }

  /**
   * 插入记录
   */  
  public boolean insert(Users users) throws SQLException {
    try{
      String sql = "insert into user(userId,sequence,nickName,password,role,imgURL) values(?,?,?,?,?,?) ";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, users.getUserId());
      pst.setString(2, users.getSequence());
      pst.setString(3, users.getNickName());
      pst.setString(4, users.getPassword());
      pst.setString(5, users.getRole());
      pst.setString(6, users.getImgURL());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  /**
   * 更新全部记录
   */
  public boolean update(Users users) throws SQLException {
    try{
      String sql = "update user set userId=?,sequence=?,nickName=?,password=?,role=? where id=?";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, users.getUserId());
      pst.setString(2, users.getSequence());
      pst.setString(3, users.getNickName());
      pst.setString(4, users.getPassword());
      pst.setString(5, users.getRole());
      pst.setInt(6, users.getId());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  /**
   * 更新部分记录
   */
  public boolean updatePart(Users users) throws SQLException {
    try{
      int cnt = 0;
      String sql = "update user set ";
      if(users.getNickName() != null && !users.getNickName().equals("")){
        sql += " nickName = '" + users.getNickName() + "',";
        cnt ++;
      }
      if(users.getPassword() != null && !users.getPassword().equals("")){
        sql += " password = '" + users.getPassword() + "',";
        cnt ++;
      }
      if(users.getImgURL() != null && !users.getImgURL().equals("")){
        sql += " imgURL = '" + users.getImgURL() + "',";
        cnt ++;
      }
      if(cnt > 0){
        sql = sql.substring(0,sql.length()-1);//去掉最后一个逗号
        sql += " where 1=1 ";//开始拼接条件
        if(users.getId()+"" != ""){
          sql += " and id = "+users.getId();
        }
      }
      pst = conn.prepareStatement(sql);
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  /**
   * 删除记录
   */
  public boolean delete(Users users) throws SQLException {
    try{
      String sql = "delete from user where id=?";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, users.getId());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  /**
   * 删除记录
   */
  public boolean deleteByUserId(Users users) throws SQLException {
    try{
      String sql = "delete from user where userId=?";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, users.getUserId());
      pst.executeUpdate();
      conn.commit();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
}
