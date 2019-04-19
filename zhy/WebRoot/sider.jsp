<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="搜索...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">目录</li>
        <li class="treeview ${cate_id==0?'active':'' }">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>网络数据分析</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class = "${cate_id==0&&page_id==0?'active':'' }"><a href="<%=basePath%>u/ftopo.do"><i class="fa fa-circle-o"></i>关注关系网络拓扑分析</a></li>
            <li class = "${cate_id==0&&page_id==1?'active':'' }"><a href="<%=basePath%>u/itopo.do"><i class="fa fa-circle-o"></i>交互关系网络拓扑分析 </a></li>
            <li class = "${cate_id==0&&page_id==2?'active':'' }"><a href="<%=basePath%>u/statistic.do"><i class="fa fa-circle-o"></i>用户信息统计分析 </a></li>
          </ul>
        </li>
        <li class="treeview ${cate_id==1?'active':'' }">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>个体行为预测</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class = "${cate_id==1&&page_id==0?'active':'' }"><a href="<%=basePath%>p/prediction.do"><i class="fa fa-circle-o"></i>个体行为预测分析</a></li>
          </ul>
        </li>
        <li class="treeview ${cate_id==2?'active':'' }">
          <a href="#">
            <i class="fa fa-database"></i>
            <span>数据采集管理</span>
          </a>
        </li>
        <li class="treeview ${cate_id==3?'active':'' }">
          <a href="#">
            <i class="fa fa-line-chart"></i><span>微博分析</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class = "${cate_id==3&&page_id==0?'active':'' }"><a href="<%=basePath%>u/analyze.do"><i class="fa fa-circle-o"></i>微博传播分析</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

