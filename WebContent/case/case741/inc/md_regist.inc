<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<!-- 用户登录模态框 -->
<div id="md_regist" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:360px">
    
      <div class="modal-header">
        <h5 id="md_regist_title" class="modal-title">用户注册</h5>
      </div>
      
      <div class="modal-body" style="height:200px;">
        <input type="text" class="form-control" id="seq" name="seq" placeholder="请输入账号" style="margin-top:20px;">
        <input type="password" class="form-control" id="pw" name="pw" placeholder="请输入密码" style="margin:20px 0px;">
        <input type="password" class="form-control" id="rePw" name="rePw" placeholder="请输入确认密码" style="margin:20px 0px;">
      </div>
      
      <div class="modal-footer">
        <label id="md_regist_memo" style="color:red;float:left"></label>
        <a href="javascript:void(0)" class="btn btn-info btn-sm" style="width:80px;" id="a_regist">注册</a>
        <a href="javascript:void(0)" class="btn btn-warning btn-sm" data-dismiss="modal">关闭</a>
      </div>
      
    </div>﻿<!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal fade -->