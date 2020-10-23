package case641;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class conPool extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request,response);
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    try{
      //1、用于加载配置文件，准备JNDI的访问环境。
      //但new InitialContext()会消耗大量服务器时间
      InitialContext ic = new InitialContext();
      //2、获取数据源的语法。大体有两种写法:
      //(javax.sql.DataSource) ctx.lookup ("java:comp/env/XXX")
      //(javax.sql.DataSource) ctx.lookup("XXX")
      //java:comp/env：环境命名上下文
      //lookup()也会消耗一定的时间
      DataSource ds = (DataSource) ic.lookup("java:comp/env/case641/conPool");
      //3、从连接池中得到一个连接
      Connection conn = ds.getConnection();
      //4、执行SQL语句，完成数据库操作
      String sql = "select * from teacher";
      PreparedStatement pst = conn.prepareStatement(sql);
      ResultSet rs = pst.executeQuery();
      ResultSetMetaData rsmd = rs.getMetaData();
      while(rs.next()){
        for (int i=1;i<=rsmd.getColumnCount();i++){
          out.print(rs.getString(i)+"  ");
        }
        out.print("<br/>");
      }
      conn.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
  }
}