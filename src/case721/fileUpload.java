package case721;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class fileUpload extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  public fileUpload() {
    super();
  }
  
  public void destroy() {
    super.destroy();
  }
  
  public void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");//解决上传文件名的中文乱码
    PrintWriter out = response.getWriter();
    int count = 0;//记录上传的文件数
    DiskFileItemFactory factory = new DiskFileItemFactory();
    factory.setSizeThreshold(1024*20);//设置缓冲区20K
    String dir = this.getServletContext().getRealPath("/");//获取应用程序根目录
    String saveFilePath = dir+"upload\\";//设置上传文件的保存目录
    File file = new File(saveFilePath);
    if(!file.exists()){
      file.mkdir();
    }
    String tempFilePath=dir+"temp";//设置临时文件的保存目录
    file=new File(tempFilePath);
    if(!file.exists()){
      file.mkdir();
    }
    factory.setRepository(new File(tempFilePath));//指定临时文件目录
    ServletFileUpload upload=new ServletFileUpload(factory);//构造上传文件对象
    upload.setFileSizeMax(1024*1024*2);//限制每个文件大小为2M
    upload.setSizeMax(1024*1024*20);//限制上传文件的总大小为20M
    upload.setHeaderEncoding("utf-8");//中文文件名按utf-8处理
    if(!ServletFileUpload.isMultipartContent(request)){
      return;//判断提交表单的类型是否为multipart/form-data
    }
    try{
      /*使用ServletFileUpload解析器解析上传数据
       * 解析结果返回的是一个List<FileItem>集合
       * 每一个FileItem对应一个Form表单的输入项*/
      List<FileItem> list=upload.parseRequest(request);
      Iterator<FileItem>it=list.iterator();
      /*利用循环处理每一个FileItem*/
      while(it.hasNext()){
        FileItem item=it.next();
        if(item.isFormField()){//判断是否为普通的表单输入项
          String formName = item.getFieldName();
          String formValue = item.getString();
          System.out.print(formName+"="+formValue+"为普通的表单输入项;");
        }else{
          String fileName=item.getName();
          if(fileName!=null){
            fileName=fileName.substring(fileName.lastIndexOf("\\")+1);//截取扩展名
            item.write(new File(saveFilePath+fileName));
            count++;
          }
        }
        out.print("成功上传"+count+"个文件！");
      }
    }catch(Exception e){
      System.out.print("文件上传失败！");
      out.println("错误原因 : " + e.toString());
      //this.getServletContext().log(e.toString());
    }
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException {
    doGet(request,response);
  }

}