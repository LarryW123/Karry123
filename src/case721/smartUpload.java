package case721;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jspsmart.upload.SmartUpload;

public class smartUpload extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private ServletConfig config;
  
  final public void init(ServletConfig config) throws ServletException {
    this.config = config;
  }
 
  protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<HTML>");
    out.println("<BODY>");
    //定义变量，用于统计上传的文件数
    int count = 0;
    //实例化一个SmartUpload类
    SmartUpload su = new SmartUpload();
    try {
      su.initialize(config, request, response);//初始化上传操作
      su.upload();//上传
      for(int i=0;i<su.getFiles().getCount();i++){
        com.jspsmart.upload.File uploadFile = su.getFiles().getFile(i);//获取上传的文件
        String realName = uploadFile.getFileName();//获取文件名
        String ext = uploadFile.getFileExt();//获取文件扩展名
        long timeStamp  = System.currentTimeMillis();//获取系统时间戳
        String fileName = timeStamp+"."+ext;//拼接文件名(文件上传到服务器后，以时间戳保存的新文件名)
        uploadFile.saveAs("/upload/"+fileName);//新文件保存
        //su.save("upload\\");//原文件名保存
        count++;
        System.out.println("上传成功");
        System.out.println("客户端上传的文件："+new String(realName.getBytes("gbk"),"utf-8"));
        System.out.println("服务器保存的文件："+fileName);
      }
      out.println("成功上传"+count+"个文件！");
    } catch (Exception e) {
      out.println("文件上传失败！");
      out.println("错误原因 : " + e.toString());
    }
    out.println("</BODY>");
    out.println("</HTML>");
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }
  
}