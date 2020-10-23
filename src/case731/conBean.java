package case731;

import java.io.*;
import java.sql.*;

public class conBean{

  Connection conn =null;
  Statement stmt = null; 
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
  
  public ResultSet stuSelect() throws SQLException, IOException{
    //连接数据库获得结果
    String sql="select * from student";
    stmt = conn.createStatement(); 
    rs = stmt.executeQuery(sql);
    return rs;
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