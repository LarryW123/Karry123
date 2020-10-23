package case641;

import java.sql.*;

public class truePaging {

  Connection conn = null;
  PreparedStatement pst = null;
  ResultSet rs = null;

  public void getConnection() throws ClassNotFoundException, SQLException {
    // 连接数据库
    String driverClass = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/teaching";
    String userName = "root";
    String passWord = "123";
    Class.forName(driverClass);
    conn = DriverManager.getConnection(url, userName, passWord);
  }

  public ResultSet getRs(int pageNo, int pageSize)
      throws ClassNotFoundException, SQLException {
    // 连接数据库获得结果
    String sql = "select * from student limit " + (pageNo-1)*pageSize + "," + pageSize;
    pst = conn.prepareStatement(sql);
    return rs = pst.executeQuery(sql);
  }
  
  public ResultSet getCnt() throws ClassNotFoundException, SQLException{
	//统计记录数
	String sql="select count(*) from student";
	pst = conn.prepareStatement(sql); 
	return rs = pst.executeQuery();
  }
  
  public void closeConn() throws SQLException {
    // 关闭记录集
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    // 关闭声明
    if (pst != null) {
      try {
        pst.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    // 关闭连接对象
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
}