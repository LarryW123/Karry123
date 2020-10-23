package case751; 

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;

import case751.HttpCharacterResponseWrapper;

public class OutputReplaceFilter implements Filter {
  
  Properties pp = new Properties();
  public void init(FilterConfig config) throws ServletException {
    try {
        String path = this.getClass().getClassLoader().getResource("/").getPath();  
            String url = path.replaceAll("%20", " ");
        String filePath = url+"case751/word.properties";
        FileInputStream iFile = new FileInputStream(filePath);
        pp.load(iFile);
    } catch (IOException e) {
      System.out.println("未找到配置文件");
    }
  }

  public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
    //自定义的 response
    HttpCharacterResponseWrapper response = new HttpCharacterResponseWrapper((HttpServletResponse) res);
    //提交给 Servlet或者下一个 Filter
    chain.doFilter(req, response);
    //得到缓存在自定义 response 中的输出内容
    String output = response.getCharArrayWriter().toString();
    //修改替换
    for (Object obj : pp.keySet()) {
      String key = (String) obj;
      output = output.replace(key, pp.getProperty(key));
    }
    // 输出
    PrintWriter out = res.getWriter();
    out.write(output);
  }

   public void destroy() {
     
  }
}