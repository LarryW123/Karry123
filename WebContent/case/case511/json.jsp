<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>解析JSON</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
      //方法一：直接使用JSON对象
      var str1={"name":"中国", 
                "province":[
                             {"name":"广东","captial":"广州"},
                             {"name":"广西","captial":"南宁"},
                             {"name":"江西","captial":"南昌"}
                           ]
               };
      document.write(str1.name+":");//读取JSON字符串的属性值
      document.write(str1.province[0].name+"<br/>");//读取JSON字符串数组的属性值

      //方法二：使用eval()解析JSON字符串
      //格式：eval("("+JSONstring+")");
      //作用：使eval函数在处理JavaScript代码的时候强制将括号内的表达式转化为对象
      //说明：
      //eval不但可以解析JSON字符串，还会执行其中的代码块
      //虽然功能强大，但如果用户在JSON字符串中注入了恶意代码
      //如：向页面插入木马链接的脚本，用eval同样是可以执行的
      //所以，使用eval函数解析JSON是一种不安全的方式
      //使用的时候，需要采用一些方法加以约束，如利用正则表达式
      var str2='{"name":"中国", "province":[{"name":"广东","captial":"广州"},{"name":"广西","captial":"南宁"},{"name":"江西","captial":"南昌"}]}';
      var obj2=eval("("+str2+")");//将数据转换为 JavaScript对象
      document.write(obj2.name+":");//读取JSON字符串的属性值
      document.write(obj2.province[1].name+"<br/>");//读取JSON数组的属性值
      
      //方法三：使用parse()解析JSON字符串
      //格式：JSON.parse(JSONstring);
      //作用：解析json格式的数据，并对字符串进行格式检查，如果格式不正确则不进行解析
      var str3='{"name":"中国", "province":[{"name":"广东","captial":"广州"},{"name":"广西","captial":"南宁"},{"name":"江西","captial":"南昌"}]}';
      var obj3=JSON.parse(str3);//将数据转换为 JavaScript对象
      document.write(obj3.name+":");//读取JSON字符串的属性值
      document.write(obj3.province[2].name+"<br/>");//读取JSON数组的属性值
      //遍历JSON对象
      for(var i=0;i<obj3.province.length;i++){
        for(j in obj3.province[i])
        {
           document.write(j+":");//key
           document.write(obj3.province[i][j]);//value
        }
        document.write("<br/>");
      }
    </script>
  </head>
  
  <body>

  </body>
</html>
