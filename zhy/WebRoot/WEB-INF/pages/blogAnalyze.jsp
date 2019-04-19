<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>数据分析平台</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=basePath %>bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<%=basePath%>dist/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="<%=basePath %>dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="sidebar-mini skin-purple-light">
<s:set name="cate_id" value= "3" />
<s:set name="page_id" value= "0" />
<!-- Site wrapper -->
<div class="wrapper">
	<jsp:include page="../../header.jsp"/>
  <!-- =============================================== -->
<jsp:include page="../../sider.jsp"/>
  <!-- Left side column. contains the sidebar -->

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Statistic page
        <small>users Statistic</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">statistic page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    	<div class="row">
    		<div class = "col-md-8" style = "min-width:650px">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-header with-border">
		          <h3 class="box-title"><i class="fa fa-bar-chart-o"></i>微博转发网络</h3>
		
		          <div class="box-tools pull-right">
					<div class="btn-group">
					  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown"><i class="fa fa-refresh"></i></button>
					  <ul class="dropdown-menu" role="menu">
					    <li><a href="#" onclick = "getInteractionNetwork(1000,null);">任取1000个节点</a></li>
					    <li><a href="#" onclick = "getInteractionNetwork(3000,null);">任取3000个节点</a></li>
					    <li><a href="#" onclick = "getInteractionNetwork(5000,null);">任取5000个节点</a></li>
					    <li class="divider"></li>
					    <!-- <li><a href="#" onclick = "getInteractionNetwork(-1);">所有节点(可能时间较长)</a></li> -->
					  </ul>
					</div>
		          </div>
		        </div>
		        <div class="box-body">
					<div class = "chart">
					<div id="graph" style="width: 1000px;height:711px;margin-left: auto;margin-right: auto;"></div>
					
					</div>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    		<div class = "col-md-4" >
    		<div class = "row">
    		<div class = "col-md-12">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-body">
		        	<div class = "chart">
					<div id="barchart" style="height: 230px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
		        	</div>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    		</div>
    		<div class = "row">
    		<div class = "col-md-12">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-body">
		        	<div class = "chart">
					<div id="wordCloud" style="height: 230px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
		        	</div>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    		</div>
    		<div class = "row">
    		<div class = "col-md-7">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-body">
		        	<div class = "chart">
					<div id="piegraph" style="height: 230px; -webkit-tap-highlight-color: transparent; user-select: none; cursor: default; background-color: rgba(0, 0, 0, 0);"></div>
		        	</div>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    		<div class = "col-md-5">
		      <!-- Default box -->
		      <div class="box">
		        <div class="box-body">
		        	<p>
					<button id="tiqu" type="button" class="btn btn-primary btn-lg">关键词提取</button>
					</p>
		        </div>
		        <!-- /.box-body -->
		      </div>
		      <!-- /.box -->
    		</div>
    		</div>
    	</div>


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.8
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://www.baidu.com">数据分析平台</a>.</strong> All rights
    reserved.
  </footer>


<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=basePath %>plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=basePath %>bootstrap/js/bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<%=basePath %>plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=basePath %>plugins/fastclick/fastclick.js"></script>
<!-- Echarts -->
<script src="<%=basePath %>plugins/echarts/echarts.min.js"></script>


<script src="<%=basePath %>plugins/echarts/echarts-wordcloud.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=basePath %>dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=basePath %>dist/js/demo.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=TtpcTSPL42KtUrbG0rWq19sWGsBo9Fwt"></script>
<script src="<%=basePath %>plugins/echarts/china.js"></script>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('graph'));
var pieChart = echarts.init(document.getElementById('piegraph'));
var barChart = echarts.init(document.getElementById('barchart'));
var wordCloud = echarts.init(document.getElementById('wordCloud'));
var url = '<%=basePath%>api/usrloc.do';
genderPie();
getBlogBar();
getWordCloud();
// 使用刚指定的配置项和数据显示图表。
getInteractionNetwork(2000,null);

function getInteractionNetwork(nodeSize,nodeIds){
	myChart.showLoading();
	$.get('<%=basePath%>api/itertopo.do?nodeSize='+nodeSize+"&nodeIds="+nodeIds, function (webkitDep) {
	    myChart.hideLoading();
	
	    option = {
	        legend: {
	            data: ['group1', 'group2', 'group3', 'group4', 'Other']
	        },
	        series: [{
	            type: 'graph',
	            layout: 'force',
	            roam: true,
	            symbol: "circle",
	            symbolSize: 5,
	            edgeSymbol: ['circle', 'arrow'],
	            edgeSymbolSize: [0, 5],
	            categories: webkitDep.categories,
	            data: webkitDep.nodes,
	            force: {
	                // initLayout: 'circular'
	                // repulsion: 20,
	                edgeLength: 5,
	                repulsion: 20,
	                gravity: 0.2
	            },
	            edges: webkitDep.links
	        }]
	    };
	
	    myChart.setOption(option);
	});
};

function genderPie(){
	$.get('<%=basePath%>api/gender.do').done(function(data){
	pieChart.setOption({
		    title : {
		        text: '微博男女比例',
		        subtext: '',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        data: data.category
		    },
		    series : [
		        {
		            name: '访问来源',
		            type: 'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:data.data,
		            itemStyle: {
		                emphasis: {
		                    shadowBlur: 10,
		                    shadowOffsetX: 0,
		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
		                }
		            }
		        }
		    ]
		});
	});
};

function getBlogBar(){
	barChart.setOption({
		title:{
			text:"主题分布",
			x:"center"
			
		},
	    color: ['#3398DB'],
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
	            axisTick: {
	                alignWithLabel: true
	            }
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:'直接访问',
	            type:'bar',
	            barWidth: '60%',
	            data:[10, 52, 200, 334, 390, 330, 220]
	        }
	    ]
	});
};


function getWordCloud(){
$.get('<%=basePath%>api/keyword.do').done(function(data){
	wordCloud.setOption({
		title:{
			text:"关键词提取",
			x:"center"
			
		},
        tooltip: {},
        series: [ {
            type: 'wordCloud',
            gridSize: 2,
            sizeRange: [12, 50],
            rotationRange: [-90, 90],
            shape: 'pentagon',
            width: 600,
            height: 400,
            drawOutOfBound: true,
            textStyle: {
                normal: {
                    color: function () {
                        return 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')';
                    }
                },
                emphasis: {
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            data: data.data
        } ]
    });
	});
}
</script>

</body>
<script type="text/javascript">
$(document).ready(function(){ 
$("#tiqu").click(function(e){
	$.get("<%=basePath%>/api/extract.do",function(data){
	alert(data.mes);});
	});
}); 
</script>
</html>

