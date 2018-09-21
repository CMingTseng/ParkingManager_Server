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
		   
	       function doDelete(id)
		   {
		      $.getJSON("${initParam.website}/admin/park_delete.php", {parkId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showAddDialog(obj)
			{
			   
			    
			   var setting = {width:300,height:300,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			   
			   
			}
			
			 function  closeAddDialog()
			{
			   
			    $('#GDialog').remove();
			    $('#global_mask').hide();
			}
			
			 function doSave()
	         {
	       
	           var Acode=$('#Acode').val();
	           var name=$('#Aname').val();
		       if($.trim(Acode)=='')
		       {
		         showETip("设备编号不能为空");
		         return;
		       }
		       if($.trim(name)=='')
		       {
		         showETip("岗亭名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/park_add.php?type=1", {parentId:${parkId},name:name,code:Acode},
			   function(data){
			       if(!data == 0)
			       {
			           window.location.reload();
			       }else
			       {
			       
			       }
		       });
	       }
	       
	       
	       function doUpdate()
	         {
	           var Ucode=$('#Ucode').val();
	           var parkId=$('#UparkId').val();
	           var name=$('#Uname').val();
		       if($.trim(Ucode)=='')
		       {
		         showETip("设备编号不能为空");
		         return;
		       }
		       if($.trim(name)=='')
		       {
		         showETip("岗亭名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/park_update.php?type=1", {parkId:parkId,name:name,code:Ucode},
			   function(data){
			       if(!data == 0)
			       {
			            Gdialog.close();
			           showSTip("修改成功");
			           $('#'+parkId).children().eq(0).html(name);
			           $('#'+parkId).children().eq(1).html(Ucode);
			       }else
			       {
			       
			       }
		       });
	       }
	       
	       function initModifyData(obj)
	       {
	         $('#UparkId').val(obj.parkId);
	         $('#Uname').val(obj.name);
	         $('#Ucode').val(obj.code);
	   
	       }
	        function gotoPage(number)
	       {
	          $('#currentPage').val(number);
	          document.getElementById("searchForm").submit();
	       }
		</script>
	</head>
	<body>
 
	            车场管理[${parkName}] > 岗亭管理
	            <div class="controlpanel">
	                <form action="${initParam.website}/admin/park_list.php?type=1&parentId=${parkId}" method="post" id="searchForm">
		               <input type="hidden" name="currentPage" id="currentPage"/>
		            </form>
		            <a class="simple_button" style="margin-left: 50px;" onclick="showAddDialog({id:'addPanel',title:'添加岗亭',close:'closeAddDialog()'});">添加</a>
		            <a class="simple_button" style="margin-left: 50px;" href="${initParam.website}/admin/park_list.php?type=0&parentId=${departmentId}">&lt;返回车场管理</a>
	            </div>
	           
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">岗亭名称</th>
		                    <th width="10%">设备编号</th>
		                    <th width="10%">所属车场</th>
		                    <th width="30%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="parkList">
	                    <c:forEach var="park" items="${page.dataList}">          
		                <tr id="${park.parkId}">	
		                   <td>${park.name }</td>
		                   <td>${park.code }</td>
		                   <td>${parkName }</td>
		                   <td>
		                       <a href="javascript:showAddDialog({id:'modifyPanel',title:'修改岗亭信息',close:'closeAddDialog()'}),initModifyData({parkId:${park.parkId},name:'${park.name}',code:'${park.code}'})">修改</a> | 
			                   <a href="javascript:doDelete(${park.parkId})">删除</a> | 
			                   <a href="${initParam.website}/admin/cashier_list.php?&parkId=${park.parkId}">收费人员管理</a> | 
			                   <a href="${initParam.website}/admin/portal_list.php?&parkId=${park.parkId}">出入口管理</a>
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
	                  <tr>	
	                      <td colspan="4">
		                   <ui:page page="${page}"></ui:page>
		                    </td>
		                 </tr>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" style="height: 100px">
				    <div class="formItem"  >
		            <label>岗亭名称</label> <input type="text" style="width: 200px;" id="Aname" />
		            </div>
		            <div class="formItem"  >
		            <label>设备编号</label> <input type="text" style="width: 200px;" id="Acode" />
		            </div>
		            <div class="formItem" >
		            <label>所属车场</label> <input type="text" style="width: 200px;" readonly="readonly" disabled="disabled" value="${parkName }" />
		            </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;top: 20px;" onclick="doSave()">保存</a>
                 </div>
		   </div>
		   
		   <div  id="modifyPanel" style="display: none;">
				 <div class="form-area" style="height: 100px">
				    <input type="hidden" style="width: 200px;" id="UparkId" />
				    <div class="formItem"  >
		            <label>岗亭名称</label> <input type="text" style="width: 200px;" id="Uname" />
		            </div>
		            <div class="formItem"  >
		            <label>设备编号</label> <input type="text" style="width: 200px;" id="Ucode" />
		            </div>
		            <div class="formItem" >
		            <label>所属车场</label> <input type="text" style="width: 200px;" readonly="readonly" disabled="disabled" value="${parkName }" />
		            </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;top: 20px;" onclick="doUpdate()">保存</a>
                 </div>
		   </div>
	</body>
</html>
