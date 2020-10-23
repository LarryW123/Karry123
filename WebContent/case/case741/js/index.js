/**
 * 照片墙
 */
function imgWall(){
  $.post(
    "/Demo/StudentAction/GetRnd",
    function(data){
      var result = JSON.parse(data);
      if(result.success){
        var img = '';
        for(var i in result.rows){
          img += '<div class="thumbnail col-xs-6 col-sm-4 col-md-3 col-lg-2" style="padding-top:20px;">';
          img += '  <img src="'+result.rows[i].imgURL+'" />';
          img += '  <div class="caption" style="text-align:center;">';
          img += '    <h3>'+result.rows[i].name+'</h3>';
          img += '    <h4>'+result.rows[i].sequence+'</h4>';
          img += '    <h4>'+result.rows[i].className+'</h4>';
          img += '  </div>';
          img += '</div>';
        }
        $("#imgWall").html(img);
      }
    }
  );
};

/**
 * 页面加载时，更新照片墙
 */
$(document).ready(function(){
  imgWall();
});

/**
 * 点击“换一批”按钮，更新照片墙
 */
$(document).ready(function(){
  $("#nextPatch").click(function(){
    imgWall();
  });
});