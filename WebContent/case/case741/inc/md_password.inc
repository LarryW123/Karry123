<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<!-- 修改密码模态框 -->
<div id="md_password" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:270px">
    
      <div class="modal-header">
        <h5 id="md_password_title" class="modal-title">修改密码</h5>
      </div>
      
      <div class="modal-body" style="height:160px;">
        <input type="password" class="form-control input-sm" style="width:240px;margin-bottom:10px" id="oldPwd" placeholder="原始密码"/>
        <input type="password" class="form-control input-sm" style="width:240px;margin-bottom:10px" id="newPwd" placeholder="新密码"/>
        <input type="password" class="form-control input-sm" style="width:240px;margin-bottom:10px" id="reNewPwd" placeholder="重复密码"/>
      </div>
      
      <div class="modal-footer">
        <label id="md_password_memo" style="color:red;float:left"></label>
        <a href="javascript:void(0)" class="btn btn-primary" id="a_password_save">保存</a>
        <a href="javascript:void(0)" class="btn btn-default" data-dismiss="modal">关闭</a>
      </div>
      
    </div>﻿<!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal fade -->