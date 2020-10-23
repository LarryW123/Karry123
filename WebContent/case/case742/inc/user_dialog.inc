<!-- 添加|修改对话框 -->
<div id="dlg_user" class="easyui-dialog" data-options="title:'会员信息维护',buttons:'#bt_dlg_user',closed:true" style="width:270px;height:350px;padding:10px"  >
  <form id="fm_user" method="post">
    <input name="id" type="hidden">
    <input name="userId" type="hidden">
    <div>
      <label>姓名：</label>
      <input name="name" class="easyui-textbox" style="width:180px">
    </div><br/>
    <div>
      <label>权限：</label>
      <input type="radio" name="role" value=0 />管理员
      <input type="radio" name="role" value=1 />商铺
      <input type="radio" name="role" value=2 />用户
    </div><br/>
    <div>
      <label>Q Q：</label>
      <input name="qq" class="easyui-textbox" style="width:180px">
    </div><br/>
    <div>
      <label>邮箱：</label>
      <input name="email" class="easyui-textbox" style="width:180px">
    </div><br/>
    <div>
      <label>手机：</label>
      <input name="phone" class="easyui-textbox" style="width:180px">
    </div><br/>
    <div>
      <label>地址：</label>
      <input name="address" class="easyui-textbox" style="width:180px">
    </div><br/>
  </form>
</div>
<!-- 对话框按钮 -->
<div id="bt_dlg_user">
  <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="saveRecord()">保存</a>
  <a class="easyui-linkbutton" data-options="iconCls:'icon-no'" onclick="javascript:$('#dlg_user').dialog('close')">退出</a>
</div>