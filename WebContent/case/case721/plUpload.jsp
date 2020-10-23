<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>jQuery多文件上传插件 plUpload</title>
    <link type="text/css" rel="stylesheet" href="case/case721/jquery-ui/jquery-ui.min.css" media="screen" />
    <link type="text/css" rel="stylesheet" href="case/case721/js/jquery.ui.plupload/css/jquery.ui.plupload.css" media="screen" />
    <style>
      #uploader{max-width:800px;margin:50px auto;}
    </style>
    <script type="text/javascript" src="case/case721/js/jquery-1.8.3.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="case/case721/jquery-ui/jquery-ui.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="case/case721/js/plupload.full.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="case/case721/js/jquery.ui.plupload/jquery.ui.plupload.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="case/case721/js/i18n/zh_CN.js" charset="UTF-8"></script>
    <script type="text/javascript">
    $(function() {
      $("#uploader").plupload({
        //基本设置
        runtimes : 'html5,flash,silverlight,html4',
        url : '/Demo/case721/smartUpload',
        max_file_size : '2048mb',//最大文件大小
        max_file_count: 10,//最大文件数量
        chunk_size: '1024mb',//文件块大小
        //在客户端调整图片大小
        resize : {
          width : 200, 
          height : 200, 
          quality : 90,
          crop: true // crop to exact dimensions
        },
        //文件类型过滤
        filters : [
          {title : "图片文件", extensions : "jpg,gif,png"},
          {title : "压缩文件", extensions : "zip,rar"},
          {title : "视频文件", extensions : "avi,mp4"}
        ],
        rename: true,//重命名文件
        sortable: true,//文件排序
        dragdrop: true,//允许文件拖放(目前仅支持HTML5)
        //激活视图
        views: {
          list: true,//列表视图
          thumbs: true,//图标视图
          active: 'thumbs'//默认为图标视图
        },
        //Flash设置
        flash_swf_url : 'js/Moxie.swf',
        //Silverlight设置
        silverlight_xap_url : 'js/Moxie.xap'
      });
    });
    </script>
  </head>
  <body>
    <div id="uploader"></div>
  </body>
</html>

<!-- 
出现错误：
  //上传大文件时，只得到一个blob文件。
错误原因：
  //chunk_size参数用来设置块的大小，当文件的大小超过该值的时候，就会被拆成该值大小的块进行上传，而服务器的上传接口不支持续传的话，就会出现blob文件。
解决方法：
  //第一种：把chunk_size参数设置成服务器允许的最大上传文件大小，基本上就可以解决问题，但这种方法治标不治本，不能越过服务器的限制上传大文件；
  //第二种：修改上传接口，使其支持续传。例如使用smartUpload而不用fileUpload。
-->
