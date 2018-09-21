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
		      $.getJSON("${initParam.website}/admin/portal_delete.php", {portalId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showDialog(obj)
			{
			    
			   var setting = {width:500,height:120,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			}
			
			 function  closeAddDialog()
			{
			   
			   $('#GDialog').remove();
			    $('#global_mask').hide();
			}
			
			 function doSave()
	         {
	       
	           var parkId=$('#AparkId').val();
	           var name=$('#Aname').val();
		       if($.trim(name)=='')
		       {
		         showETip("岗亭入口名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/portal_add.php", {parkId:parkId,name:name},
			   function(data){
			       if(!data == 0)
			       {
			          Gdialog.close();
			          showSTip("新增成功");
			          var tr="<tr id="+data+"><td>"+name+"</td><td>${parkName}</td><td><a href=\"javascript:showDialog({id:'modifyPanel',title:'修改岗亭出口'}),initModifyData({portalId:"+data+",name:'"+name+"'})\">修改</a> | <a href='javascript:doDelete("+data+")'>删除</a></td></tr>"
			          $('#noDataTr').remove();
			          $(tr).fadeIn().appendTo('#portalList');
			       }else
			       {
			       
			       }
		       });
	       }
	       
	       
	       function doUpdate()
	         {
	       
	           var portalId=$('#UportalId').val();
	           var name=$('#Uname').val();
		       if($.trim(name)=='')
		       {
		         showETip("岗亭出入口名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/portal_update.php", {portalId:portalId,name:name},
			   function(data){
			       if(!data == 0)
			       {
			          Gdialog.close();
			          showSTip("修改成功");
			          $('#'+portalId).children().eq(0).html(name);
			       }else
			       {
			       
			       }
		       });
	       }
	        function initModifyData(obj)
	       {
	         $('#UportalId').val(obj.portalId);
	         $('#Uname').val(obj.name);
	       }
		</script>
	</head>
	<body>
 
	             岗亭管理[${parkName}] > 出入口管理
	            <div class="controlpanel">
		            <a class="simple_button" style="margin-left: 50px;" onclick="showDialog({id:'addPanel',title:'添加岗亭出口',close:'closeAddDialog()'});">添加</a>
		            <a class="simple_button" style="margin-left: 50px;" href="${initParam.website}/admin/park_list.php?type=1&parentId=${parentId}">&lt;返回岗亭管理</a>
	            </div>
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                     
		                    <th width="10%">出入口名称</th>
		                    <th width="10%">所属岗亭</th>
		                    <th width="8%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="portalList">
	                    <c:forEach var="portal" items="${dataList}">          
		                <tr id="${portal.portalId}">	
		                   <td>${portal.name }</td>
		                   <td>${parkName}</td>
		                   <td>
		                       <a href="javascript:showDialog({id:'modifyPanel',title:'修改岗亭出口'}),initModifyData({portalId:${portal.portalId},name:'${portal.name }'})">修改</a> | 
			                   <a href="javascript:doDelete(${portal.portalId})">删除</a>
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="3">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" >
				    <input type="hidden" id="AparkId" value="${parkId}"/>
		            <div class="formItem" style=" float: left;">
		            <label style=" width: 80px;">出入口名称</label> <input type="text" style="width: 200px;" id="Aname" />
		             </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 50px;top: 20px;" onclick="doSave()">保存</a>
                 </div>
		   </div>
		   
		    <div  id="modifyPanel" style="display: none;">
				 <div class="form-area" >
				    <input type="hidden" id="UportalId" />
		            <div class="formItem" style=" float: left;">
		            <label style=" width: 80px;">出入口名称</label> <input type="text" style="width: 200px;" id="Uname" />
		             </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 50px;top: 20px;" onclick="doUpdate()">保存</a>
                 </div>
		   </div>
		 <div id="global_mask" style="position: absolute;top: 0px;left: 0px;z-index: 998;background: #BED1D8;opacity: 0.5;width: 100%;height: 600px;display: none;"></div>
		   
	</body>
</html>
