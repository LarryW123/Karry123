<!-- 轮播图 -->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-bottom:20px">
  <!-- 游标点 -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>
  <!-- 轮播图片 -->
  <div class="carousel-inner" role="listbox">
    <div class="item active" align="center"><img src="/Demo/case/case741/img/carousel/01.png" alt="暂无图片" ></div>
    <div class="item" align="center"><img src="/Demo/case/case741/img/carousel/02.png" alt="暂无图片" ></div>
    <div class="item" align="center"><img src="/Demo/case/case741/img/carousel/03.png" alt="暂无图片" ></div>
    <div class="item" align="center"><img src="/Demo/case/case741/img/carousel/04.png" alt="暂无图片" ></div>
  </div>
  <!-- 控制按钮 -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  </a>
</div>

<!-- 设置轮播动画时间间隔 -->
<script type="text/javascript">
$(document).ready(function() {
  $('.carousel').carousel({
    interval: 5000
  });
});
</script>
