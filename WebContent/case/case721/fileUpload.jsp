<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>文件上传</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <!-- 
    //将文件上传控件file的multiple属性改为multiple即可同时选中多个文件 
    //fileUpload的缺陷：
  -->
  <body>
    <hr/><label>多个文件上传：后台以fileUpload为例</label><hr/>
    <form name="fileUpload" action="case721/fileUpload" method="post" enctype="multipart/form-data">
      <input type="file" name="file" multiple="multiple"><br/><br/>
      <input type="submit" value="上传"><br/>
    </form>
  </body>
</html>
