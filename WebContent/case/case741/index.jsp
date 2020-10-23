<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>教学管理系统（AJAX+MVC综合示例）</title>
    
    <meta name="keywords" content="教育,成绩,教学,学校,学员" /><!-- 网站检索关键字-->
    <meta name="robots" content="index,follow" /><!-- 搜索引擎索引方式--> 
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- IE兼容 -->
    <meta name="renderer" content="webkit"><!-- 国产浏览器高速模式 -->
    
    <link rel="Shortcut Icon" href="/Demo/index/logo.ico"><!-- 标题栏图标 -->
    <link rel="Bookmark" href="/Demo/index/logo.ico" /><!-- 收藏夹图标 -->   
    
    <link rel="stylesheet" href="/Demo/case/case741/bootstrap/css/bootstrap.min.css"><!-- BootStrap核心样式 -->
    <script src="/Demo/case/case741/bootstrap/js/jquery.min.js"></script><!-- jquery脚本-->
    <script src="/Demo/case/case741/bootstrap/js/bootstrap.min.js"></script><!-- BootStrap核心脚本-->
  </head>
  
  <!-- 后台代码层次划分及主要功能：-->
  <!-- 一、DButil类:定义数据库连接和关闭-->
  <!-- 二、Pojo类:定义与数据表相关的实体，用于封装和传递参数-->
  <!-- 三、DAO层:也称作单笔业务DAO，负责封装数据库逻辑，实现单张表的增删改查，并将结果返回给Service层-->
  <!-- 四、Service层:主要功能-->
  <!--    1、也称作业务DAO，调用DAO层逻辑来实施复杂业务，调用时将Action层传递过来的Pojo交给DAO层-->
  <!--    2、接收DAO层传递过来的数据(一般为集合)，并转交给Action层-->
  <!-- 五、Action层:主要功能-->
  <!--    1、即contrallor，利用Pojo封装前台传递过来的参数，并传递给ServiceDAO层，以下达任务-->
  <!--    2、接收ServiceDAO层传递过来的数据(一般为集合)，并转发给View层-->
  <!-- 六、View层:主要功能-->
  <!--    1、接收Action层传递过来的数据(一般为集合)-->
  <!--    2、将数据响应给客户端-->
  <!--    例如，将数据转换为JSON字符串，再以文本形式响应给客户端-->
  <!--    或者，将数据以Excel形式响应给客户端-->
  <!--    再或者，将数据打包压缩，再响应给客户端等-->
  
  <!-- 前台代码层次划分及主要功能：-->
  <!-- 一、HTML页面:主要功能-->
  <!--    1、页面布局-->
  <!--    2、展现界面和数据-->
  <!-- 二、CSS文件:主要功能-->
  <!--    1、渲染页面元素-->
  <!-- 三、JavaScript:主要功能-->
  <!--    1、发送AJAX请求-->
  <!--    2、处理回调数据-->
  <!--    3、重新渲染页面-->
  <!-- 四、其他文件 -->
  <!--    1、img图片文件-->
  <!--    2、json列表数据，用于下拉列表框读取-->
  <!--    2、inc片段文件，用于复用的表格、模态框等-->
  
  <body style="background-image:url('/Demo/case/case741/img/bg.png')">
    <!-- 导航条 -->
    <div class="container-fluid">
      <%@ include file="/case/case741/inc/header.inc" %>
    </div>
    <!-- 轮播图 -->
    <div class="container-fluid">
      <%@ include file="/case/case741/inc/index/carousel.inc" %>
    </div>
    <!-- 相片墙 -->
    <div class="container-fluid">
      <%@ include file="/case/case741/inc/index/imgWall.inc" %>
    </div>
    <!-- 站底信息 -->
    <div class="container-fluid">
      <%@ include file="/case/case741/inc/footer.inc" %>
    </div>
    <!-- 页面相关模态框 -->
    <%@ include file="/case/case741/inc/md_login.inc" %>
    <%@ include file="/case/case741/inc/md_regist.inc" %>
    <!-- 页面相关脚本-->
    <script src="/Demo/case/case741/js/index.js"></script>
  </body>
</html>