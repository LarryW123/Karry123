<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <script type="text/javascript">
      var i=1;//用于文件上传组件的计数
      function addFile(){
        i=i+1;
        var div=document.getElementById("addInput");
        //添加文件上传的表单组件
        div.innerHTML=div.innerHTML+'file'+i.toString()+'<input type="file" name="file1"'+i.toString+'"><br/><br/>';
      }
    </script>
  </head>
  <!--  
  //将多个文件上传控件放在同一个form中，可以同时提交给服务器
  //smartUpload的缺陷：底层默认为gbk编码，对文件名中的中文需要做进一步处理
  -->
  <body>
    <hr/><label>单个文件上传：后台以smartUpload为例</label><hr/>
    <form name="upload" action="case721/smartUpload" method="post" enctype="multipart/form-data">
      <label>file1</label><input type="file" name="file1">
      <input type="button" value="增加上传" onclick="javascript:addFile();"><br/><br/>
      <div id="addInput">
      <!-- 动态添加文件上传组件 -->
      </div>
      <input type="submit" value="上传"><br/>
    </form>
    <br/><br/>

    <hr/><label>文件下载：后台以smartUpload为例</label><hr/>
    <form action="case721/smartDownload" method="post">
      <label>请输入下载文件名：</label>
      <input type="text" name="download" size="20px" maxlength="255">
      <input type="submit" value="下载">
    </form>
  </body>
</html>
