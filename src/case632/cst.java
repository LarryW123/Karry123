package case632;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cst extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    Connection conn = null;
    CallableStatement cst = null;
    request.setCharacterEncoding("utf-8");
    String sequence = request.getParameter("sequence");
    String name = request.getParameter("name");
    String sex = request.getParameter("sex");
    String birthday = request.getParameter("birthday");
    try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/teaching";
      String user = "root";
      String password = "123";
      conn = DriverManager.getConnection(url, user, password);
      String sql = "{call insertStu(?,?,?,?)}";
      cst=conn.prepareCall(sql);
      cst.setString(1,sequence);
      cst.setString(2,name);
      cst.setString(3,sex);
      cst.setString(4,birthday);
      int s = cst.executeUpdate();
      if(s>0){out.print("操作成功");}
      else{out.print("操作失败");}
    }
    catch(Exception e){
       out.print("数据库操作出错："+e);
    }
    finally{
      //关闭数据库连接
      if(cst!=null){
        try{cst.close();}
        catch(SQLException e){e.printStackTrace();}
      }
      if(conn!=null){
        try{conn.close();}
        catch(SQLException e){e.printStackTrace();}
      }
    }
  }

}
