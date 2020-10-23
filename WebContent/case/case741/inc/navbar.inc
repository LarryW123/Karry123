<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
﻿<!-- 左侧导航 -->    
<div class="panel-group" id="menu">
  <div class="panel panel-default">
    <!-- 菜单 --> 
    <a data-toggle="collapse" data-parent="#menu" href="#menu_basic">
      <div class="panel-heading" style="background-color:#333;">
        <label>基础信息</label>
      </div>  
    </a>
    <!-- 列表项 --> 
    <div id="menu_basic" class="panel-collapse collapse in" role="tabpanel">
      <a href="javascript:void(0)" id="stuClass"><div class="panel-body">院系班级</div></a>
      <a href="javascript:void(0)" id="student"><div class="panel-body">学生管理</div></a>
      <a href="javascript:void(0)" id="teacher"><div class="panel-body">教师管理</div></a>
      <a href="javascript:void(0)" id="course"><div class="panel-body">课程管理</div></a>
      <a href="javascript:void(0)" id="classroom"><div class="panel-body">教室管理</div></a>
    </div>
  </div>

  <div class="panel panel-default">
    <a data-toggle="collapse" data-parent="#menu" href="#menu_teaching">
      <div class="panel-heading" style="background-color:#333;">
        <label>授课任务</label>
      </div>  
    </a>
    <div id="menu_teaching" class="panel-collapse collapse" role="tabpanel">
      <a href="javascript:void(0)" id="task"><div class="panel-body">任务分配</div></a>
      <a href="javascript:void(0)" id="teaching"><div class="panel-body">排课</div></a>
    </div>
  </div>

  <div class="panel panel-default">
    <a data-toggle="collapse" data-parent="#menu" href="#menu_score">
      <div class="panel-heading" style="background-color:#333;">
        <label>成绩管理</label>
      </div>  
    </a>
    <div id="menu_score" class="panel-collapse collapse" role="tabpanel">
      <a href="javascript:void(0)" id="score"><div class="panel-body">成绩管理</div></a>
      <a href="javascript:void(0)" id="count"><div class="panel-body">成绩统计</div></a>
    </div>
  </div>
</div>

<style>
  .panel a{color:#999;}
  .panel-body:hover{background-color:#eee;}
</style>