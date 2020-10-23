<!-- 数据表格 -->
<table id="dg_user" class="easyui-datagrid" 
       data-options="singleSelect:true,fit:true,toolbar:'#tb',
       pagination:true,pageSize:10,pageList:[5,10,20,50,100],
       onHeaderContextMenu:createGridHeaderContextMenu,
       loadMsg:'数据正在努力加载，请稍后...'" >
  <thead>
    <tr>
      <th data-options="field:'selector',checkbox:true"></th>
      <th data-options="field:'id',width:40,align:'center',hidden:true">编号</th>
      <th data-options="field:'userId',width:100,align:'center'">会员卡号</th>
      <th data-options="field:'name',width:120,align:'center'">姓名</th>
      <th data-options="field:'password',width:100,align:'center',hidden:true">密码</th>
      <th data-options="field:'role',width:60,align:'center'" formatter="formatterRole">权限</th>
      <th data-options="field:'qq',width:100,align:'center'">QQ</th>
      <th data-options="field:'email',width:160,align:'center'">电子邮箱</th>
      <th data-options="field:'phone',width:120,align:'center'">联系电话</th>
      <th data-options="field:'address',width:240,align:'center'">联系地址</th>
    </tr>
  </thead>
</table>