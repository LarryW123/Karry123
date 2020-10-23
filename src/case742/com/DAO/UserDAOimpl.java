package case742.com.DAO;
import java.sql.*;
import java.util.ArrayList;

import case742.com.pojo.User;

public class UserDAOimpl implements UserDAO {
  private Connection conn = null;
  private PreparedStatement pst = null;
  /**
   * 定义构造方法，实例化的时候完成连接的注入
   */
  public UserDAOimpl(Connection conn) {
    super();
    this.conn = conn;
  }
  
  //统计记录
  public int count(User user) throws SQLException, ClassNotFoundException {
    String sql = "select count(*) as cnt from user";
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    rs.next();
    int cnt = Integer.parseInt(rs.getString("cnt"));
    return cnt;
  }
  
  //查询记录
  public ArrayList<User> select(User user) throws SQLException {
    String sql = "select * from user where 1=1";
    String condition = user.getCondition();
    String limit = user.getLimit();
    if(condition !=null && !condition.equals("")){
      sql += " and " + condition;
    }
    if(limit !=null && !limit.equals("")){
    	sql += limit;
    }
    pst = conn.prepareStatement(sql);
    ResultSet rs = pst.executeQuery();
    ArrayList<User> UserList = new ArrayList<User>();
    if(rs.next()){
      for(int i=0;i<=rs.getRow();i++){
          User userTmp = new User();
          userTmp.setId(rs.getInt("id"));
          userTmp.setUserId(rs.getString("userId"));
          userTmp.setName(rs.getString("name"));
          userTmp.setPassword(rs.getString("password"));
          userTmp.setRole(rs.getInt("role"));
          userTmp.setQq(rs.getString("qq"));
          userTmp.setEmail(rs.getString("email"));
          userTmp.setPhone(rs.getString("phone"));
          userTmp.setAddress(rs.getString("address"));
          UserList.add(userTmp);
        rs.next();
      }
    }
    return UserList;
  }

  //插入记录
  public boolean insert(User user) throws SQLException {
    try{
      String sql = "insert into user(userId,name,password,role,qq,email,phone,address) values(?,?,?,?,?,?,?,?) ";
      pst = conn.prepareStatement(sql);
      pst.setString(1, user.getUserId());
      pst.setString(2, user.getName());
      pst.setString(3, user.getPassword());
      pst.setInt(4, user.getRole());
      pst.setString(5, user.getQq());
      pst.setString(6, user.getEmail());
      pst.setString(7, user.getPhone());
      pst.setString(8, user.getAddress());
      pst.executeUpdate();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  //更新记录
  public boolean update(User user) throws SQLException {
    try{
      String sql = "update user set userId=?,name=?,password=?,role=?,qq=?,email=?,phone=?,address=? where id=?";
      pst = conn.prepareStatement(sql);
      pst.setString(1, user.getUserId());
      pst.setString(2, user.getName());
      pst.setString(3, user.getPassword());
      pst.setInt(4, user.getRole());
      pst.setString(5, user.getQq());
      pst.setString(6, user.getEmail());
      pst.setString(7, user.getPhone());
      pst.setString(8, user.getAddress());
      pst.setInt(9, user.getId());
      pst.executeUpdate();
      return true;
    }catch(Exception e){
      return false;
    }
  }
  
  //删除记录
  public boolean delete(User user) throws SQLException {
    try{
      String sql = "delete from user where id=?";
      pst = conn.prepareStatement(sql);
      pst.setInt(1, user.getId());
      pst.executeUpdate();
      return true;
    }catch(Exception e){
      return false;
    }
  }

}
