<div id="headdiv" style="width:600px;height:80px;background:#000;color:#fff">
  现在是：<%= (new java.util.Date()).toString() %>
  <br/>
  <%! int i=0; %><% i=i+1; %>您是本页面的第<%= i%>位访问者
</div>