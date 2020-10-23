package case631;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class jdbc extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
    out.println("<HTML>");
    out.println("  <HEAD><TITLE>student</TITLE></HEAD>");
    out.println("  <BODY>");
    
    try{
      //1、加载数据库驱动
      Class.forName("com.mysql.jdbc.Driver");
      //2、提供JDBC的URL
      String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
      String user="root";
      String password="123";
      //3、创建数据库连接
      try {
        Connection conn = DriverManager.getConnection(url,user,password);
        System.out.print("数据库连接成功");
        //4、获得Statement实例
        String sql="select * from student";
        Statement stmt=conn.createStatement();
        //5、执行SQL语句
        ResultSet rs=stmt.executeQuery(sql);
        //6、处理结果
        ResultSetMetaData rsmd=rs.getMetaData();
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print(rsmd.getColumnName(i)+"   ");//先显示列名
        }
        out.print("<br/>");
        
        //ResultSetMetaData rsmd=rs.getMetaData();
        while(rs.next()){
          //方法一：通过列名获取字段值，此方法更直观，且维护性更好
          /*String sequence=rs.getString("sequence");
          String name=rs.getString("name");
          String sex=rs.getString("sex");
          String card=rs.getString("card");
          out.print(sequence);
          out.print(name);
          out.print(sex);
          out.print(card);
          out.print("<br/>");*/
          //方法二：通过列索引值获得字段值，此方法更高效，但可读性和可维护性不高
          //注意：列是从左到右编号的，且从1开始编号
          for (int i=1;i<=rsmd.getColumnCount();i++){
            out.print(rs.getString(i)+" ");
          }
          out.print("<br/>");
        }
        //7、关闭JDBC对象
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
      catch(SQLException e) {
        System.out.print("数据库连接失败");
      }
    }
    catch(Exception e){
      System.out.print("驱动加载失败");
    }
    
    out.println("  </BODY>");
    out.println("</HTML>");
    out.flush();
    out.close();
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request,response);
  }

}
