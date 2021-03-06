<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pv" uri="/pageTaglib"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="decorator" content="default"/>
  <style type="text/css">
    button{
      margin-right:5px;
    }
  </style>

</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>公司管理</h1>
    </section>
    <!-- Main content -->
    <shiro:hasPermission name="company:query">
	    <section class="content">
	      <div class="row">
	        <div class="col-lg-12">
	          <div class="box">
	            <div class="box-header" style="margin: 0 auto;">
		          <div class="row" style="text-align:center">
					<div class="col-lg-12" style="margin: 0 auto;">
						<input id="btnAdd" class="btn btn-primary" type="button" value="添加节点">
						<input id="btnMove" class="btn btn-success" type="button" value="节点移动">
						<input id="btnDel" class="btn btn-danger" type="button" value="删除节点">
					</div>
				  </div>
	            </div>
				<div class="row" style="float: right;">
					<div class="col-lg-4">
						<div class="panel panel-primary " >
							<div class="panel-heading">
								<h3 class="panel-title">公司管理</h3>
							</div>
							<div class="panel-body right_centent">
								<div id="left-tree"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="panel panel-primary ">
							<div class="panel-heading">
								<h3 class="panel-title">编辑区</h3>
							</div>
							<!--编辑操作权限 start-->
		                <div class="panel-body right_centent">
		                <div id="editShow">
		                	<div>
		                        <div class="input-group margin-t-5">
			                        <span class="input-group-addon span-group" >名称:</span>
		                            <input id="editname" type="text"  class="form-control input-group" />
		                        </div>
		                    </div>
		                    <div>
								<div class="input-group margin-t-5">
									<span class="input-group-addon span-group" >公司联系人:</span>
									<input id="editcompanyContact" type="text" class="form-control input-group" />
								</div>
							</div>
							<div>
								<div class="input-group margin-t-5">
									<span class="input-group-addon span-group" >联系人电话:</span>
									<input id="editcompanyTel" type="text" class="form-control input-group" />
								</div>
							</div>
							<div>
								<div class="input-group margin-t-5">
									<span class="input-group-addon span-group" >公司地址:</span>
									<input id="editcompanyAddress" type="text" class="form-control input-group" />
								</div>
							</div>
							<div>
								<div class="input-group margin-t-5 ">
									<span class="input-group-addon span-group" >所属公司:</span>
									<select id="editcompanyPid" name="companyPid" class="form-control input-group" >
			   						</select>
								</div>
							</div>
							<div>
								<div class="input-group margin-t-5">
									<span class="input-group-addon span-group" >备注信息:</span>
									<input id="editremarks" type="text" class="form-control input-group" />
								</div>
							</div>
							<div>
								<div class="input-group margin-t-5">
									<span class="input-group-addon span-group" >状态:</span>
									<select id="editstatus" name="editstatus" class="form-control input-group" >
									     <option value="-1" >不可用</option>
									     <option value="1" >可用</option>
								    </select>
								</div>
							</div>
		                    <div style="margin-top: 10px;">
		                        <input id="Edit" class="btn btn-primary" type="button" value="确定" />
		                        <input id="Edit_cancel" class="btn btn-default" type="button" style="margin-left:80px;display:none;" value="取消" />
		                    </div>
		                </div>
		                </div>
		                <!--编辑操作权限 end-->
						</div>
					</div>
				</div>
				<div>
					<!--弹出框 新增权限 start-->
					<div class="modal fade" id="addOperation-dialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content radius_5">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title" id="myModalLabel">新增</h4>
								</div>
								<div class="modal-body">
									<div group="" item="add">
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >公司名称:</span>
												<input id="companyName" type="text" class="form-control" />
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >公司联系人:</span>
												<input id="companyContact" type="text" class="form-control" />
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >联系人电话:</span>
												<input id="companyTel" type="text" class="form-control" />
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >公司地址:</span>
												<input id="companyAddress" type="text" class="form-control" />
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >所属公司:</span>
												<select id="companyPid" name="companyPid" class="form-control" >
						   						</select>
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >备注信息:</span>
												<input id="remarks" type="text" class="form-control" />
											</div>
										</div>
										<div>
											<div class="input-group margin-t-5">
												<span class="input-group-addon span-group" >状态:</span>
												<select id="status" name="status" class="form-control" >
												     <option value="-1" >不可用</option>
												     <option value="1" >可用</option>
											    </select>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button id="Save" type="button" class="btn btn-primary">保存</button>
									<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								</div>
							</div>
						</div>
					</div>
				</div>
	          </div>
	          </div>
	        </div>
	    </section>
    </shiro:hasPermission>
  </div>
</div>
<script src="/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/js/raphael-min.js"></script>
<script src="/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="/plugins/knob/jquery.knob.js"></script>
<script src="/js/moment.min.js"></script>
<script src="/js/bootstrap-treeview.js"></script>
<script src="/bootstrap/js/bootstrap-dialog.min.js"></script>
<script src="/js/customPlugin.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/plugins/fastclick/fastclick.js"></script>
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/dist/js/app.min.js"></script>
<script src="/dist/js/demo.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/layui/layui.js" charset="utf-8"></script>
<script src="/js/jquery.validate.min.js" charset="utf-8"></script>
<script src="/js/layuiUtil.js" charset="utf-8"></script>
<script>
layui.use('layer', function(){ //独立版的layer无需执行这一句
	  var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
});
</script>
  <script type="text/javascript">
		$(function(){
			onLoad();
			BindEvent();
			 //页面加载
			 function onLoad()
			 {
		     	//渲染树
		     	$('#left-tree').treeview({
		     		data: getTree(),
		     		levels: 2,
		     		onNodeSelected:function(event, node){
		     			$("#editcompanyPid option[selected=selected]").removeAttr("selected");
		     			$("#editstatus option[selected=selected]").removeAttr("selected");
		     			$.ajax({
			    	         type: "GET",
			    	         url: "/admin/company/getById",
			    	         data: {"id":node.id},//父节点顶端
			    	         async:false,
			    	         dataType: "json",
			    	         success: function(data){
			    	        	 var msg = data.message;
			    	        	 var object = data.object;
			    	        	 if(data.code == "200"){
			    	        		 $('#editname').val(object.name);
			    	        		 $('#editcompanyContact').val(object.contact);
			    	        		 $('#editcompanyTel').val(object.phone);
			    	        		 $('#editcompanyAddress').val(object.address);
			    	        		 $("#editstatus option[value="+object.status+"]").attr("selected", "true");
			    	        		 //$('#editcompanyPid').val(object.parentCompany);
			    	        		 $('#editremarks').val(object.remarks);
			    	        		 $("#editcompanyPid option[value="+object.parentId+"]").attr("selected", "selected");
			    	        		}else{
			                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
			                	 }
			    	         },
			    	         error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	        	 alert("error");
			    	               }
			    	     });
		     		},
					showCheckbox:false//是否显示多选
				});   
		     }
		     //事件注册
		     function BindEvent()
		     {
		     	 //保存-新增
		     	 $("#Save").click(function () {
		     	 	$('#addOperation-dialog').modal('hide')
                    //静态添加节点
                    var parentNode = $('#left-tree').treeview('getSelected');
                    
                    var companyName = $('#companyName').val();
	        		var companyContact = $('#companyContact').val();
	        		var companyTel = $('#companyTel').val();
	        		var companyPid = $('#companyPid').val();
	        		var companyAddress = $('#companyAddress').val();
	        		var remarks = $('#remarks').val();
	        		var status = $('#status').val();
	        		var parentId = parentNode[0].id;
                    $.ajax({
		    	         type: "GET",
		    	         url: "/admin/company/updateAndAdd",
		    	         data: {"name":companyName,
			    	        	 "contact":companyContact,
			    	        	 "phone":companyTel,
			    	        	 "address":companyAddress,
			    	        	 "remarks":remarks,
			    	        	 "status":status,
			    	        	 "parentId":companyPid},
		    	         async:false,  
		    	         dataType: "json",
		    	         success: function(data){
		    	        		 var msg = data.message;
		    	        		 var id = data.object.id;
			    	        	 if(data.code == "200"){
			                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
				                    var node = {
				                    	text: $('#companyName').val(),
				                    	id:id
				                    };
				                    $('#left-tree').treeview('addNode', [node, parentNode]);
			                		 console.log(1);
			                	 }else{
		                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
		                	 }
		    	         },
		    	         error: function(XMLHttpRequest, textStatus, errorThrown) {
		    	        	 alert("error");
		    	               }
		    	     });
                    });
		     	}
		     	//保存-编辑
		     	$('#Edit').click(function(){
		     		var node = $('#left-tree').treeview('getSelected');
		     		var editname = $('#editname').val();
		     		var editcompanyContact = $('#editcompanyContact').val();
		     		var editcompanyTel =  $('#editcompanyTel').val();
		     		var editcompanyPid =  $('#editcompanyPid').val();
		     		var editcompanyAddress =  $('#editcompanyAddress').val();
		     		var editremarks =  $('#editremarks').val();
		     		var editstatus = $('#editstatus').val();
				     		$.ajax({
				    	         type: "GET",
				    	         url: "/admin/company/updateAndAdd",
				    	         data: {"name":editname,
					    	        	 "contact":editcompanyContact,
					    	        	 "phone":editcompanyTel,
					    	        	 "address":editcompanyAddress,
					    	        	 "remarks":editremarks,
					    	        	 "status":editstatus,
					    	        	 "parentId":editcompanyPid,
					    	        	 "id":node[0].id},
				    	         async:false,  
				    	         dataType: "json",
				    	         success: function(data){
				    	        	 var msg = data.message;
				    	        	 if(data.code == "200"){
				    	        		 $('#editname').val();
				    	        		 $('#editcompanyContact').val();
				    	        		 $('#editcompanyTel').val();
				    	        		 $('#editcompanyAddress').val();
				    	        		 $('#editremarks').val();
				    	        		 $('#editstatus').val();
				                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
				                	 }else{
				                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
				                	 }
				    	         },
				    	         error: function(XMLHttpRequest, textStatus, errorThrown) {
				    	        	 alert("error");
				    	               }
				    	     });
		     		
					
				$('#left-tree').treeview('updateNode', [ node, newNode]);
		     	});



			//显示-添加
			$("#btnAdd").click(function(){
				var node = $('#left-tree').treeview('getSelected');
// 				if (node.length == 0) {
// 					$.showMsgText('请选择节点');
// 					return;
// 				}
				$('#addName').val('');
				$('#addOperation-dialog').modal('show');
				
			});
			//显示-编辑
			$("#btnEdit").click(function(){
				var node=$('#left-tree').treeview('getSelected');
				$('#editShow').show();

			});
			//删除
			$("#btnDel").click(function(){
				var node = $('#left-tree').treeview('getSelected');
				if (node.length == 0) {
					$.showMsgText('请选择节点');
					return;
				}
				layer.msg('确定删除吗？', {
					  time: 0 //不自动关闭
					  ,btn: ['确定', '取消']
					  ,yes: function(index){
					    layer.close(index);
					    
					    $.ajax({
			    	         type: "GET",
			    	         url: "/admin/company/delete",
			    	         data: {"companyId":node[0].id},//父节点顶端
			    	         async:false,  
			    	         dataType: "json",
			    	         success: function(data){
			    	        	 var msg = data.message;
			    	        	 if(data.code == "200"){
			                		 $('#editName').val("");
			                		 del();
			                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
			                	 }else{
			                		 layer.msg(msg, {icon: 1,time: 2000});//1.5秒关闭
			                	 }
			    	         },
			    	         error: function(XMLHttpRequest, textStatus, errorThrown) {
			    	        	 alert("error");
			    	               }
			    	     });
					  }
				})
				  function del(){
					$('#left-tree').treeview('removeNode', [ node, { silent: true } ]);
				  }
				
			});
			$("#btnMove").click(function(){
				$.showMsgText('更新中...');
			});

		    function getTree() {
		    	var result =[];
		    	  $.ajax({
		    	         type: "GET",
		    	         url: "/admin/company/getJson",
		    	         data: {"parentId":0},//父节点顶端
		    	         async:false,  
		    	         dataType: "json",
		    	         showCheckbox:true,
		    	         success: function(data){
		    	        	  result = [{
		    	                 text: '公司管理',
		    	                 color: "green",
		    	                 fontsize : "200px",
		    	                 backColor: "#FFFFFF",
		    	                 selectable: true,
		    	                 nodes: eval('['+data.object+']')
		    	             }]
		    	         },
		    	         error: function(XMLHttpRequest, textStatus, errorThrown) {
		    	        	 alert("error");
		    	             alert(XMLHttpRequest.status);
		    	             alert(XMLHttpRequest.readyState);
		    	             alert(textStatus);
		    	               }
		    	     });
		    	             return result;
		    }
			/*-----页面pannel内容区高度自适应 start-----*/
			$(window).resize(function () {
				setCenterHeight();
			});
			setCenterHeight();
			function setCenterHeight() {
				var height = $(window).height();
				var centerHight = height - 240;
				$(".right_centent").height(centerHight).css("overflow", "auto");
			}
			/*-----页面pannel内容区高度自适应 end-----*/
		});
		
		//获取销售人员列表;
		$(document).ready(function(){
			loadCompany(); 
			});
		
		function loadCompany(){
			  var url='/admin/company/getList'; 
			  jQuery.ajax({
			    type:'post', 
			    url:url, 
			    async:false,
			    success:function (data){
		   	   var companyList = data.object;
		         if(companyList != null && companyList.length > 0){
		             for(var i = 0; i< companyList.length; i++){
		                 $("<option value='"+companyList[i].id+"'>"+companyList[i].name+"</option>").appendTo("#companyPid"); 
		                 $("<option value='"+companyList[i].id+"'>"+companyList[i].name+"</option>").appendTo("#editcompanyPid"); 
		             }  
		         } 
			    } 
			  }); 
			}
	</script>
</body>
</html>