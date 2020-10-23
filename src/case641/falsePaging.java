package case641;

import java.sql.*;

public class falsePaging{

  Connection conn =null;
  PreparedStatement stmt = null; 
  ResultSet rs = null;
  
  public void getConnection() throws ClassNotFoundException, SQLException{
	//连接数据库
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/teaching";
	String userName="root";
	String passWord="123";
	Class.forName(driverClass);
	conn = DriverManager.getConnection(url,userName,passWord);
  }
  
  public ResultSet getRs() throws ClassNotFoundException, SQLException{
	//查询
	String sql="select * from student";
	stmt = conn.prepareStatement(sql); 
	return rs = stmt.executeQuery();
  }
  
  public ResultSet getCnt() throws ClassNotFoundException, SQLException{
	//统计记录数
	String sql="select count(*) from student";
	stmt = conn.prepareStatement(sql); 
	return rs = stmt.executeQuery();
  }
  
  public void closeConn() throws SQLException{
	//关闭记录集
	if(rs!=null){
	  try{rs.close();}
	  catch(SQLException e){e.printStackTrace();}
	}
	//关闭声明
	if(stmt!=null){
	  try{stmt.close();}
	  catch(SQLException e){e.printStackTrace();}
	}
	//关闭连接对象
	if(conn!=null){
	  try{conn.close();}
	  catch(SQLException e){e.printStackTrace();}
	}
  }
}