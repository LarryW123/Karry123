package case731;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class conDemo extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
    out.println("<HTML>");
    out.println("  <HEAD><TITLE>数据库逻辑封装</TITLE></HEAD>");
    out.println("  <BODY>");
    
    try{
      //初始化
      String driverClass="com.mysql.jdbc.Driver";
      String url="jdbc:mysql://localhost:3306/teaching";
      String userName="root";
      String passWord="123";
      String sql="select * from student";
      //连接数据库
      Class.forName(driverClass);//加载驱动
      Connection conn = DriverManager.getConnection(url,userName,passWord);//创建连接
      Statement stmt = conn.createStatement(); //创建连接状态
      ResultSet rs = stmt.executeQuery(sql); //执行查询 
      //遍历查询结果
      ResultSetMetaData rsmd=rs.getMetaData();
      while(rs.next()){
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print(rs.getString(i)+" ");
        }
        out.print("<br/>");
      }
      //断开连接
      rs.close();
      stmt.close();
      conn.close();  
    }catch(Exception e){
      e.printStackTrace();
    }
    out.println("  </BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    doGet(request, response);
  }

}
