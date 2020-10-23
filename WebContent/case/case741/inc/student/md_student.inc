<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<!-- 学生管理模态框 -->
<div class="modal fade" id="md_student" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="md_student_title">学生管理</h4>
      </div>
      
      <div class="modal-body">
        <form class="form-horizontal" id="fm_student">
          <input type="hidden" name="id" />
          <div class="form-group has-error" >
            <label for="sequence" class="col-sm-3 control-label">学号：</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="sequence" name="sequence" placeholder="(必填项)请输入学号"/>
            </div>
          </div>
          <div class="form-group">
            <label for="name" class="col-sm-3 control-label">姓名：</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名"/>
            </div>
          </div>
          <div class="form-group">
            <label for="sex" class="col-sm-3 control-label">性别：</label>
            <div class="col-sm-9">
              <label class="radio-inline"><input type="radio" name="sex" value="男" checked>男</label>
              <label class="radio-inline"><input type="radio" name="sex" value="女">女</label>
            </div>
          </div>
          <div class="form-group">
            <label for="birthday" class="col-sm-3 control-label">出生日期：</label>
            <div class="col-sm-9">
              <input type="date" class="form-control" id="birthday" name="birthday"/>
            </div>
          </div>
          <div class="form-group">
            <label for="card" class="col-sm-3 control-label">身份证号：</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="card" name="card" placeholder="请输入身份证号"/>
            </div>
          </div>
          <div class="form-group">
            <label for="nation" class="col-sm-3 control-label">民族：</label>
            <div class="col-sm-9">
              <select class="form-control" id="nation" name="nation"></select>
            </div>
          </div>
          <div class="form-group">
            <label for="nativePlace" class="col-sm-3 control-label">籍贯：</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="nativePlace" name="nativePlace" placeholder="请输入籍贯"/>
            </div>
          </div>
          <div class="form-group">
            <label for="political" class="col-sm-3 control-label">政治面貌：</label>
            <div class="col-sm-9">
              <select class="form-control" id="political" name="political">
                <option value="党员">党员</option>
                <option value="团员">团员</option>
                <option value="群众" selected>群众</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="className" class="col-sm-3 control-label">所在班级：</label>
            <div class="col-sm-9">
              <select class="form-control" id="className" name="className"></select>
            </div>
          </div>
        </form>
      </div>
      
      <div class="modal-footer">
        <a id="a_save" class="btn btn-info btn-sm" href="javascript:void(0)" style="width:80px"><span class="icon-document-checked"></span>保存</a>
        <a class="btn btn-warning btn-sm" href="javascript:void(0)" style="width:80px" data-dismiss="modal"><span class="icon-document-cancel"></span>关闭</a>
      </div>
      
    </div>﻿<!-- modal-content -->
  </div><!-- modal-dialog -->
</div><!-- modal fade -->