package case721;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.SmartUpload;

public class smartDownload extends HttpServlet {

  private static final long serialVersionUID = 1L;
  
  private ServletConfig config;
  final public void init(ServletConfig config) throws ServletException {
    this.config = config;
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String fileName = new String(request.getParameter("download").getBytes("ISO8859_1"),"utf-8");
    SmartUpload su = new SmartUpload();
    try {
      su.initialize(config, request, response);
      su.setContentDisposition(null);
      su.downloadFile("upload\\"+fileName);
    } catch (Exception e) {
      e.printStackTrace();
      System.out.print("文件未找到！");
    }
  }
  
  protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
}
