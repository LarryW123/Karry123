package case631;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.*;

public class check extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    doGet(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    String name = request.getParameter("userName"); 
    String pw = request.getParameter("passWord");
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try { 
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
      String user = "root";
      String password = "123";
      conn = DriverManager.getConnection(url,user,password);
      stmt = conn.createStatement();
      String sql="select * from user where userId='"+name+"'";
      rs = stmt.executeQuery(sql);
      if(rs.next())
      {
        String passWord=rs.getString("password").trim().toString();
        if(passWord.equals(pw)){
          //将各列写入Session
          HttpSession se=request.getSession();//创建Session对象
          ResultSetMetaData rsmd=rs.getMetaData();//获取列集合
          //以上rs获取的仍是user中的信息，请同学们自行编写代码，来获取对应student或teacher中的信息
          for (int i=1;i<=rsmd.getColumnCount();i++){//遍历各列
            String seName=rsmd.getColumnName(i).toString();//保存列名
            String seValue=rs.getString(i);//保存列值
            se.setAttribute(seName,seValue);//写入Session
          }
          response.sendRedirect("/Demo/case/case631/main.jsp");
        }else{
        response.sendRedirect("/Demo/case/case631/login.jsp");
        }
      }
      else{
        response.sendRedirect("/Demo/case/case631/regist.jsp");
      }
    }
    catch (Exception e){
       System.out.print("数据库连接失败");
    } 
    finally{
      if(rs!=null){
        try {
          rs.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if(conn!=null){
        try {
          conn.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
      if(stmt!=null){
        try {
          stmt.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }      
    }
  }

}
