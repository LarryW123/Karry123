$(document).ready(function(){
  //脚本代码仅供参考,同学们发现什么错误，或者更好的方法，欢迎交流
});

/*------------------以下为JSP页面及按钮代码------------------*/

/**
 * 初始化数据表格tbl_student
 */
$(document).ready(function(){
  $('#tbl_student').bootstrapTable({
    method:'get',//bootstrap默认的内置请求方式
    contentType:"application/json",//接收的是json字符串
    url:"/Demo/StudentAction/Get",//要请求数据的文件路径
    queryParamsType:'limit',//查询参数组织方式
    sidePagination:'server',//指定服务器端分页
    pagination:true,//是否分页，即分页按钮
    pageSize:10,//单页记录数
    pageList:[10,20,50,100],//分页步进值
    paginationHAlign:'right',//分页条水平对齐
    paginationVAlign:'bottom',//分页条垂直对齐
    search:true,//显示搜索框
    searchAlign:'right',//搜索框对齐方式
    searchOnEnterKey:true,//搜索按回车搜索，否则自动触发
    showExport:true,//显示导出按钮
    exportTypes:['doc','excel','csv','png','txt','sql','json','xml'],//导出文件类型
    exportDataTypes:'all',//basic当前页,all所有,selected选中行；仅是本地导出，不会重新发送请求
    exportOptions:{
      fileName:'学生表',//导出文件名
      worksheetName:'学生表',//工作表名
      tableName:'学生表'//表格名
    },
    singleSelect:true,//只能选中一行
    clickToSelect:true,//点击选中行
    showRefresh:false,//刷新按钮
    showColumns:true,//显示/隐藏列按钮
    buttonsAlign:'right',//工具栏按钮位置
    toolbar:'#tb_student',//自定义工具栏对齐方式
    toolbarAlign:'left',//自定义工具栏对齐方式
    locale:'zh-CN',//支持中文
    onLoadSuccess:function(data) {//加载成功时执行
      //var result = JSON.parse(data);
      //alert(result.success);
    },
    onLoadError:function(status,res){//加载失败时执行
      //alert(status+":"+res);
    },
    onClickRow:function(row,$element,field){//单击行时触发
      //alert(row.id);
    }
  });
});

/**
 * 刷新表格：暂无用
 */
function refresh(){
  $('#tbl_student').bootstrapTable('refresh',{url:'/Demo/StudentAction/Get'});
};

/**
 * 添加:a_insert按钮
 */
var url;//用于保存请求接口的地址
$(document).ready(function(){
  $('#a_insert').click(function(){
    $("#fm_student")[0].reset();//重置表单
    $('#md_student_title').html('添加学生');//修改标题
    url = "/Demo/StudentAction/Insert"//定义接口
  });
});

/**
 * 修改:a_update按钮
 */
$(document).ready(function(){
  $('#a_update').click(function(){
    var rows = $("#tbl_student").bootstrapTable('getSelections');//获取选中行
    if(rows[0] == null){
      $.showMessage("请选择需要修改的记录!");
      return;
    }
    $('#md_student').modal('show');//打开模态框
    $('#md_student_title').html('修改学生');//修改标题
    for(var i=0;i<Object.entries(rows[0]).length;i++) {
      var id =  Object.entries(rows[0])[i][0];//id:选中行数据中的key
      var text = Object.entries(rows[0])[i][1];//text:选中行数据中的value
      $('#md_student [name="'+id+'"]').val(text);//将获取到的值加到表单对应的input框中
    }
    url = "/Demo/StudentAction/Update"//定义接口
  });
});

/**
 * 保存：模态框md_student中的a_save按钮
 */
$(document).ready(function(){
  $("#a_save").click(function(){
    var sequence = $("#sequence").val();
    if(sequence == null || sequence == ""){
      $.showMessage("学号是必填项");
      return;
    }else{
      var data = $("#fm_student").serializeArray();
      $.post(url,data,
        function(data){
          $('#tbl_student').bootstrapTable('refresh');//刷新表格
        }
      )
    }
    $('#md_student').modal('hide');
  });
});

/**
 * 删除：a_delete按钮
 */
$(document).ready(function(){
  $("#a_delete").click(function(){
    var rows = $("#tbl_student").bootstrapTable('getSelections');
    if(rows[0] == null){
      $.showMessage("请选择需要删除的记录!");
      return;
    }
    var warn = window.confirm("确定要删除吗？");
    if(warn == true){
      $.post(
        "/Demo/StudentAction/Delete",
        {"id":rows[0].id},
        function(data){
          $('#tbl_student').bootstrapTable('refresh');
        }
      );
    }
  });
});

/**
 * 重置密码:a_resetPwd按钮
 */
$(document).ready(function(){
  $("#a_resetPwd").click(function(){
    var rows = $("#tbl_student").bootstrapTable('getSelections');
    if(rows[0] == null){
      $.showMessage("请选择需要重置密码的记录!");
      return;
    }
    $.post(
      "/Demo/UsersAction/ResetPwd",
      {"id":rows[0].id},
      function(data){
        $.showMessage(data);
      }
    );
  });
});

/*--------------以下为模态框md_student代码------------------*/

/**
 * “民族”列表项
 */
$(document).ready(function(){
  $(document).load(
    "/Demo/case/case741/json/nation.json",
    function(data){
      console.log(data);
      var result = JSON.parse(data);
      for(var i in result){
        $("#nation").append("<option value='"+result[i].text+"'>"+result[i].text+"</option>");
      }
    }
  );
});

/**
 * “班级”列表项
 */
$(document).ready(function(){
  //未做
});