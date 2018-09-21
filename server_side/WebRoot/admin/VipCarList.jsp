<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tld/SuperTag.tld"  prefix="ui" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
	<head>
		<title></title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>  
		<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/context.css"/>
		 <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ThemeBlue.css"/>
    <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/button.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/global.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ucenter.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/form.css"/>
    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${initParam.website}/theme/framework.js"></script>
		<script type="text/javascript">
		   
		   
		    function gotoPage(number)
	       {
	         $('#currentPage').val(number);
	          document.getElementById("searchForm").submit();
	       }
	       
	       function doDelete(id)
		   {
		      $.getJSON("${initParam.website}/admin/vip_delete.php", {vipId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showAddDialog(obj)
			{
			   var setting = {width:300,height:250,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			   
			}
			
			 function  closeAddDialog()
			{
			   
			    $('#GDialog').remove();
			    $('#global_mask').hide();
			}
			
			 function doSave()
	         {
	       
	           var AcarCode=$('#AcarCode').val();
	           var AexpireTime=$('#AexpireTime').val();
		       if($.trim(AcarCode)=='')
		       {
		          showETip( "VIP车牌号不能为空");
		         return;
		       }
		       if($.trim(AexpireTime)=='')
		       {
		         showETip( "到期时间不能为空");
		         
		         return;
		       }
		       $.post("${initParam.website}/admin/vip_add.php?type=1", {carCode:AcarCode,expireTime:AexpireTime,parkId:${parkId}},
			   function(data){
			       if(!data == 0)
			       {
			           window.location.reload();
			       }else
			       {
			       
			       }
		       });
	       }
	       
	       function initModifyData(obj)
	       {
	         $('#UvipId').val(obj.vipId);
	         $('#UcarCode').val(obj.carCode);
	         $('#UexpireTime').val(obj.expireTime);
	       }
	       function doUpdate()
	         {
	           
	           var AcarCode=$('#UcarCode').val();
	           var vipId=$('#UvipId').val();
	           var AexpireTime=$('#UexpireTime').val();
		       if($.trim(AcarCode)=='')
		       {
		         showETip( "VIP车牌号不能为空");
		         return;
		       }
		       if($.trim(AexpireTime)=='')
		       {
		         showETip( "到期时间不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/vip_update.php?type=1", {carCode:AcarCode,expireTime:AexpireTime,vipId:vipId},
			   function(data){
			       if(!data == 0)
			       {
			            Gdialog.close();
			            showSTip( "修改成功");
			           $('#'+vipId).children().eq(1).html(AcarCode);
			           $('#'+vipId).children().eq(2).html(AexpireTime);
			           
			       }else
			       {
			          
			       }
		       });
	       }
	       
		</script>
	</head>
	<body >
 
	            车场管理[${prakName}] > VIP车辆管理
	            <form action="${initParam.website}/admin/vip_list.php?parkId=${parkId}" method="post" id="searchForm">
		            <input type="hidden" name="currentPage" id="currentPage"/>
		        </form>
	            <div class="controlpanel" >
		            <a class="simple_button" style="margin-left: 50px;" onclick="showAddDialog({id:'addPanel',title:'添加VIP车辆',close:'closeAddDialog()'});">添加</a>
	                <a class="simple_button" style="margin-left: 50px;" href="${initParam.website}/admin/park_list.php?type=0&parentId=${departmentId}">&lt;返回车场管理</a>
	            </div>
	           
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">所属车场</th>
		                    <th width="10%">车牌号</th>
		                    <th width="10%">到期时间</th>
		                    <th width="30%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="vipList">
	                    <c:forEach var="vip" items="${page.dataList}">          
		                <tr id="${vip.vipId}">	
		                   <td>${prakName}</td>
		                   <td>${vip.carCode }</td>
		                   <td>${vip.expireTime }</td>
		                   <td>
		                       <a href="javascript:showAddDialog({id:'modifyPanel',title:'修改VIP信息',close:'closeAddDialog()'}),initModifyData({vipId:${vip.vipId},carCode:'${vip.carCode}',expireTime:'${vip.expireTime }'})">修改</a> | 
			                   <a href="javascript:doDelete(${vip.vipId})">删除</a> 
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${page.count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="4">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                 <tr id="noDataTr">	
		                   <td colspan="4"> <ui:page page="${page}"></ui:page></td>
		            </tr>
		            </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" style="height: 100px">
				    <div class="formItem"  >
		            <label>车牌号码</label> <input type="text" style="width: 200px;" id="AcarCode" maxlength="7"/>
		            </div>
		            <div class="formItem"  >
		            <label>到期时间</label> <input type="text" style="width: 200px;" id="AexpireTime" />
		            </div>
		            <p style="margin-top: -10px;margin-left: 78px;">时间格式如:2013-01-25</p>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;" onclick="doSave()">保存</a>
                 </div>
		   </div>
		   
		   <div  id="modifyPanel" style="display: none;">
				 <div class="form-area" style="height: 100px">
				    <input type="hidden" style="width: 200px;" id="UvipId" />
				    <div class="formItem"  >
		            <label>车牌号码</label> <input type="text" style="width: 200px;" id="UcarCode" maxlength="7"/>
		            </div>
		            <div class="formItem"  >
		            <label>到期时间</label> <input type="text" style="width: 200px;" id="UexpireTime" />
		            </div>
		             <p style="margin-top: -10px;margin-left: 78px;">时间格式如:2013-01-25</p>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;" onclick="doUpdate()">保存</a>
                 </div>
		   </div>
	</body>
</html>
