<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--表格中th最重要的属性data-field：这个属性值必须与数据库中的字段名称完全一致-->
<table id="tbl_student" class="table table-bordered table-striped table-condensed table-hover data-search">
  <thead>
    <tr>
      <th data-field="select" data-checkbox="true" data-halign="center" data-align="center" data-valign="middle" data-width="20" >全选</th>
      <th data-sortable="true" data-field="id" data-width="40" data-halign="center" data-align="center" data-valign="middle" data-visible="false">序号</th>
      <th data-sortable="true" data-field="sequence" data-width="120" data-halign="center" data-align="center" data-valign="middle" data-searchable="true">学号</th>
      <th data-sortable="true" data-field="name" data-width="80" data-halign="center" data-align="center" data-valign="middle" data-searchable="true">姓名</th>
      <th data-sortable="true" data-field="sex" data-width="40" data-halign="center" data-align="center" data-valign="middle">性别</th>
      <th data-sortable="true" data-field="birthday" data-width="100" data-halign="center" data-align="center" data-valign="middle">出生日期</th>
      <th data-sortable="true" data-field="card" data-width="120" data-halign="center" data-align="center" data-valign="middle">身份证号</th>
      <th data-sortable="true" data-field="nation" data-width="80" data-halign="center" data-align="center" data-valign="middle">民族</th>
      <th data-sortable="true" data-field="nativePlace" data-width="120" data-halign="center" data-align="center" data-valign="middle">籍贯</th>
      <th data-sortable="true" data-field="political" data-width="60" data-halign="center" data-align="center" data-valign="middle">政治面貌</th>
      <th data-sortable="true" data-field="className" data-width="80" data-halign="center" data-align="center" data-valign="middle">所在班级</th>
    </tr>
  </thead>
</table>
<div id="tb_student">
  <a id="a_insert" class="btn btn-success btn-sm" href="javascript:void(0)" style="width:80px" data-toggle="modal" data-target="#md_student"><span class="icon-clipboard-add"></span>添加</a>
  <a id="a_update" class="btn btn-success btn-sm" href="javascript:void(0)" style="width:80px"><span class="icon-clipboard-edit"></span>修改</a>
  <a id="a_delete" class="btn btn-success btn-sm" href="javascript:void(0)" style="width:80px"><span class="icon-clipboard-remove"></span>删除</a>
  <a id="a_resetPwd" class="btn btn-success btn-sm" href="javascript:void(0)" style="width:80px"><span class="icon-clipboard-edit"></span>重置密码</a>
</div>