package case512;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class date extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
    out.println("<HTML>");
    out.println("  <HEAD><TITLE>第一个Servlet程序</TITLE></HEAD>");
    out.println("  <BODY>");
    out.println("方法一：使用Date处理日期"+"<br/>");
    //原始格式：
    Date d=new Date();
    out.println("原始格式："+d+"<br/>");
    //使用Date格式化数据
    String date= (d.getYear()+1900)+"年"+(d.getMonth()+1)+"月"+d.getDate()+"日 "+d.getHours()+"时"+d.getMinutes()+"分"+d.getSeconds()+"秒";
    out.println("处理过的数据格式："+date+"<br/><br/>");
    
    out.println("方法二：使用Calendar处理日期"+"<br/>");
    //原始格式
    //TimeZone.setDefault(TimeZone.getTimeZone("GMT+8"));//时区为东八区
    //Calendar cal = new GregorianCalendar();//1、定义一个cal对象
    //cal.setTime(new Date());//2、设置为当前时间
    //Calendar用于替代老的Date类，一般用以下方法获得当前时间
    Calendar cal = Calendar.getInstance();//使用目前时区得到当前时间
    out.println("原始格式："+cal.getTime()+"<br/>");
    //如果拿时间不是为了计算，而仅仅是为了展示,用以下格式更方便
    SimpleDateFormat sdft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    out.println("简单格式化处理："+sdft.format(cal.getTime())+"<br/>");
    
    //如果拿时间是为了计算，或进行个性化的数据格式化
    //可以使用Calendar提供的各种方法来进行数据的格式化
    int yy=cal.get(Calendar.YEAR);//年
    int mm=cal.get(Calendar.MONTH) + 1;//月
    int dd=cal.get(Calendar.DATE);//日
    int hh=cal.get(Calendar.HOUR);//时
    int min=cal.get(Calendar.MINUTE);//分
    int sec=cal.get(Calendar.SECOND);//秒
    int ms=cal.get(Calendar.MILLISECOND);//秒
    out.println("处理过的数据格式："+yy+"年"+mm+"月"+dd+"日 "+hh+"时"+min+"分"+sec+"秒"+ms+"毫秒<br/>");
  
    out.println("<br/>附：Calendar更多用法<br/>");
    out.println("星期"+cal.get(Calendar.DAY_OF_WEEK)+"<br/>");
    out.println("是今年第"+cal.get(Calendar.DAY_OF_YEAR)+"天<br/>");  
    out.println("是本月第"+cal.get(Calendar.DAY_OF_MONTH)+"天<br/>");  
  
    cal.add(Calendar.HOUR, 3);//3小时以后
    out.println("3小时以后："+cal.get(Calendar.HOUR)+"时<br/>");  
    
    cal.add(Calendar.MINUTE, -30);//30分钟前
    out.println("30分钟前："+cal.get(Calendar.MINUTE)+"分<br/>");
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
