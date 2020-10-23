<% String panelIndex=request.getParameter("panelIndex");%>
<div class="easyui-accordion" style="width:100%;">
  <div title="用户管理" <%if("0".equals(panelIndex)){%> data-options="selected:true"<%}%>>
    <a href="user.jsp?panelIndex=0" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">会员管理</a>
    <a href="user.jsp?panelIndex=0" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">商铺管理</a>
  </div>
  <div title="商品管理" <%if("1".equals(panelIndex)){%> data-options="selected:true"<%}%>>
    <a href="user.jsp?panelIndex=1" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">商品类别</a>
    <a href="user.jsp?panelIndex=1" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">商品品牌</a>
    <a href="user.jsp?panelIndex=1" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">商品管理</a>
  </div>
  <div title="通知公告" <%if("2".equals(panelIndex)){%> data-options="selected:true"<%}%>>
    <a href="user.jsp?panelIndex=2" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">网站公告</a>
    <a href="user.jsp?panelIndex=2" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">网站动态</a>
    <a href="user.jsp?panelIndex=2" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">网站新闻</a>
  </div>
  <div title="数据统计" <%if("3".equals(panelIndex)){%> data-options="selected:true"<%}%>>
    <a href="user.jsp?panelIndex=3" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">进货统计</a>
    <a href="user.jsp?panelIndex=3" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">出货统计</a>
    <a href="user.jsp?panelIndex=3" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">存货统计</a>
  </div>
  <div title="店铺评价" <%if("4".equals(panelIndex)){%> data-options="selected:true"<%}%>>
    <a href="user.jsp?panelIndex=4" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" style="width:100%;text-align:left;">差评统计</a>
  </div>
</div>