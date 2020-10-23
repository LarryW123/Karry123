package case632;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pst extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    //初始化
    Connection conn = null;
    PreparedStatement pst = null;
    String sql = null;
    request.setCharacterEncoding("utf-8");
    String sequence = request.getParameter("sequence");
    String name = request.getParameter("name");
    String sex = request.getParameter("sex");
    String birthday = request.getParameter("birthday");
    int optRecord = Integer.parseInt(request.getParameter("optRecord"));
    try{
      //连接数据库
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/teaching?useUnicode=true&characterEncoding=UTF8";
      String user = "root";
      String password = "123";
      conn = DriverManager.getConnection(url,user,password);
      try{
        //执行SQL语句
        switch (optRecord){
          case 1:
            sql = "insert into student(sequence,name,sex,birthday) values(?,?,?,?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1,sequence);
            pst.setString(2,name);
            pst.setString(3,sex);
            pst.setString(4,birthday);
            break;
          case 2:
            sql = "delete from student where sequence=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1,sequence);
            break;
          case 3:
            sql = "update student set name=?,sex=?,birthday=? where sequence=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,sex);
            pst.setString(3,birthday);
            pst.setString(4,sequence);
            break;
        }
        int s = pst.executeUpdate();
        if(s>0){out.print("操作成功");}
        else{out.print("操作失败");}
      }
      catch(Exception e){
        out.print("SQL执行错误");
      }
    }
    catch(Exception e){
      e.printStackTrace();
      out.print("数据库连接错误");
    }
    finally{
      //关闭数据库连接
      if(pst!=null){
        try{pst.close();}
        catch(SQLException e){e.printStackTrace();}
      }
      if(conn!=null){
        try{conn.close();}
        catch(SQLException e){e.printStackTrace();}
      }
    }
  }

}
