/**
 * 用户登录
 */
$(document).ready(function(){
  $("#a_login").click(function(){
    sequence = $("#sequence").val();
    password = $("#password").val();
    //输入字符的合法性验证
    var reg = /^[\u4E00-\u9FA5\w\d]+$/;//只能是汉字、字母、数字、下划线
    var isRight = reg.test(sequence) && reg.test(password);
    if (!isRight){
      $.showMessage("账号或密码包含非法字符!");
      return false;
    }
    //输入字符的有效性验证
    if(sequence == null || sequence.length == 0){
      $("#span").html("请输入账号");
      return false;
    }
    if(password == null || password.length == 0){
      $("#span").html("请输入密码");
      return false;
    }
    //通过基本验证，发送登录请求
    $.post(
      "/Demo/UsersAction/Login",
      {"sequence":sequence,"password":password},
      function(data){
        var result = JSON.parse(data);
        if(result.success){
          window.location.href = "/Demo/case/case741/main/basic/student.jsp";
        }else{
          $("#span").html(result.msg);
        }
      }
    );
  });
});


/**
 * 用户注册
 */
$(document).ready(function(){
  $("#a_regist").click(function(){
    seq = $("#seq").val();
    pw = $("#pw").val();
    rePw = $("#rePw").val();
    //输入字符的合法性验证
    var reg = /^[\u4E00-\u9FA5\w\d]+$/;//只能是汉字、字母、数字、下划线
    var isRight = reg.test(seq) && reg.test(pw);
    if (!isRight){
      $.showMessage("账号或密码包含非法字符!");
      return false;
    }
    //输入字符的有效性验证
    if(seq == null || seq.length == 0){
      $("#span").html("请输入账号");
      return false;
    }
    if(pw == null || pw.length == 0){
      $("#span").html("请输入密码");
      return false;
    }
    if(rePw == null || rePw.length == 0){
    	$("#span").html("请输入确认密码");
    	return false;
    }
    if(pw != rePw){
      $.showMessage("两次密码不一致!");
      return;
    }
    //通过基本验证，发送登录请求
    $.post(
      "/Demo/UsersAction/Regist",
      {"sequence":sequence,"password":password},
      function(data){
        var result = JSON.parse(data);
        $("#span").val(result.msg);
      }
    );
  });
});

/**
 * 修改密码
 */
$(document).ready(function(){
  $("#a_password_save").click(function(){
    var oldPwd = $("#oldPwd").val();//原始密码
    var newPwd = $("#newPwd").val();//新密码
    var reNewPwd = $("#reNewPwd").val();//确认密码
    var pwd = "<%=session.getAttribute('password')%>";//保存在session中的密码
    if(oldPwd == "" || newPwd == "" || reNewPwd == ""){$.showMessage("请输入完整信息！");return false;}
    if(newPwd != reNewPwd){$.showMessage("二次密码不一致！");return false;}
    $.post(
      "/Demo/UsersAction/UpdatePwd",
      {"oldPwd":oldPwd,"newPwd":newPwd,"reNewPwd":reNewPwd},
      function(data){
        $.showMessage(data);
      }
    );
  });
});

/**
 * 用户注销
 */
$(document).ready(function(){
  $("#a_exit").click(function(){
    window.location.href="/Demo/UsersAction/Exit";
  });
});