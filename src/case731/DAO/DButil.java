package case731.DAO;

import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 完成数据库的连接和关闭
 */
public class DButil {
  /**
   * 传统做法：
   * 将数据库连接参数在代码中写死
   * String driverClass="com.mysql.jdbc.Driver";
   * String url="jdbc:mysql://localhost:3306/teaching";
   * String userName="root";
   * String passWord="123";
   * 弊端：每次部署到服务器，就需要更改代码，这就意味着，代码要在服务器上重新编译
   * -------------------------------------------------
   * 现在较为流行的做法：
   * 将数据库连接参数保存到properties配置文件中
   * 程序开始时，会读取properties配置文件中的参数
   * 这样做的好处：
   * 程序部署到服务器以后，若更换数据库服务器IP、更换数据库用户名或密码，只需要修改properties配置文件
   */
  private static Properties prop = new Properties();
  private static String driverClass;
  private static String url;
  private static String userName;
  private static String passWord;
  /**
   * 另外：
   * 我们一般会将读取 Properties定义为静态代码块
   * 让JVM加载类时自动执行它，且只被执行一次
   */
  static {
    InputStream is = DButil.class.getClassLoader().getResourceAsStream("config.properties");
    try {
      prop.load(is);
      driverClass = prop.getProperty("driverClass");
      url = prop.getProperty("url");
      url = url.replaceAll("%20", " ");//路径中的空格编码为%20
      userName = prop.getProperty("userName");
      passWord = prop.getProperty("passWord");
      Class.forName(driverClass);
    }catch (Exception e) {
      e.printStackTrace();
    }finally{
      if(is!=null){
        try {
          is.close();
        }
        catch (IOException e){
          e.printStackTrace();
        }
      }
    }
  }
  
  /**
  * 将读取 getConnection定义为静态方法
  * 以保证同一事务使用的是同一个连接
  */
  public static Connection getConnection(){  
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url,userName,passWord);
      conn.setAutoCommit(false);//注意：为防止事务自动提交，我们习惯在这里将事务的提交方式改为手动提交
    }catch (SQLException e) {
      e.printStackTrace();
    }
    return conn;
  }

  /**
  * 将 closeConnection也定义为静态方法
  */
  public static void closeConnection(Connection conn) {
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

}
