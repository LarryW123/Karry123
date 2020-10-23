<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<!-- 用户登录模态框 -->
<div id="md_login" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:360px">
    
      <div class="modal-header">
        <h5 id="md_login_title" class="modal-title">用户登录</h5>
      </div>
      
      <div class="modal-body" style="height:200px;">
        <input type="text" class="form-control" id="sequence" name="sequence" placeholder="请输入账号" style="margin-top:20px;">
        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" style="margin:20px 0px;">
        <span id="span" style="color:#990000;font-size:12px;"></span>
        <p style="width:100%;font-size:12px;text-align:right;padding-top:20px;">
          <a id="btnPw" href="javascript:void(0);">忘记密码</a> | <a id="btnRegist" href="javascript:void(0);">用户注册</a>
        </p>
      </div>
      
      <div class="modal-footer">
        <label id="md_login_memo" style="color:red;float:left"></label>
        <a href="javascript:void(0)" class="btn btn-info btn-sm" style="width:80px;" id="a_login">登录</a>
        <a href="javascript:void(0)" class="btn btn-warning btn-sm" data-dismiss="modal">关闭</a>
      </div>
      
    </div>﻿<!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal fade -->