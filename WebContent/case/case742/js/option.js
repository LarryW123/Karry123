/**
 * <summary>基本增删改查导出相关脚本</summary>
 * <param name="searchRecord()">查询
 * <param name="saveRecord()">保存
*/

var url = null;//请求远程数据的地址
var condition = null;//文本框的值，作为查询条件使用
var param = null;//拼接的查询条件，字符串型
var jsonParam = null;//转换后的查询条件，JSON型

//页面加载时查询
$(document).ready(function(){

  $("#btn_Query").click();
});

//单击查询按钮
$("#btn_Query").click(function(){
  url="/Demo/userAction/Get";
  condition = $("#txt_UserName").val();
  if(condition != null){
    param = '{"condition":"'+condition+'"}';
  }else{
    param = null;
  }
  jsonParam = JSON.parse(param);
  searchRecord();
});

//查询记录
/**
* queryParams：在请求远程数据时发送额外的参数
* 格式：queryParams:{key1:value1,key2:value2}
* 参数类型：JSON对象
*/
function searchRecord(){
  $('#dg_user').datagrid({
    url:url,
    queryParams:jsonParam,
    success:function (data){
      $("#dg_user").datagrid("loadData",data.rows);  
    }
  });
};

//单击添加按钮
$("#btn_Add").click(function(){
  $("#dlg_user").dialog("open");
  $("#fm_user").form("clear");
  url = "/Demo/userAction/Insert";
});

//单击修改按钮
$("#btn_Edit").click(function(){
  var row = $("#dg_user").datagrid("getSelected");//获取选中行的记录号
  if (row == null){
    alert("请选择需要修改的记录");
    return;
  }
  $("#dlg_user").dialog("open"); 
  $("#fm_user").form("load",row);//根据选中行的记录号读取该行记录
  url = "/Demo/userAction/Update";
});

//单击保存按钮
function saveRecord(){
  var val=$('input:radio[name="role"]:checked').val();
  if(val==null){
    alert("请选择一个权限!");
    return false;
  }
  else{
    $("#fm_user").form("submit",{
      url: url,
      //验证表单提交的函数：当validate()返回值是true时，表单提交，反之不提交
      onSubmit: function(para){
        return $(this).form("validate");
      },
      //回调函数：成功时执行
      success: function(result){
        var obj = JSON.parse(result);
        showMessage("提示",obj.msg,2000);
        $("#dg_user").datagrid("reload");  
        $("#dlg_user").dialog("close"); 
      }
    });
  }
}

//单击删除按钮
$("#btn_Del").click(function(){
  var row = $("#dg_user").datagrid("getSelected");
  if (row == null){
    alert("请选择需要删除的记录");
    return;
  }
  url = "/Demo/userAction/Delete";
  var id = row.id;
  $.messager.confirm('提示', '确认要删除吗?', function(data){
    if (data){
      $.post(
        url,
        {id:id},
        function(result){
          var obj = JSON.parse(result);
          showMessage("提示",obj.msg,2000);
          $("#dg_user").datagrid("reload");           
      });
    }
  });  
});

//格式化权限
function formatterRole(value){
  switch(value){
  case 0:
    return "管理员";break;
  case 1:
    return "商铺";break;
  case 2:
    return "会员";break;
  default:
    return "未知权限";break;
  }
}

//退出登录
$(document).ready(function() {
  $("#a_exit").click(function(){
    window.location.href="/Demo/userAction/Exit";
  });
});