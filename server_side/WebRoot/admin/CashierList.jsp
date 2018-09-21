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
		      $.getJSON("${initParam.website}/admin/cashier_delete.php", {cashierId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showDialog(obj)
			{
			   
			   var setting = {width:300,height:360,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			   
			}
			
			 
			 function doSave()
	         {
	       
	           var Aaccount=$('#Aaccount').val();
	           var name=$('#Aname').val();
	           var telephone=$('#Atelephone').val();
		       if($.trim(Aaccount)=='')
		       {
		           showETip( "账号不能为空");
		         return;
		       }
		       if($.trim(name)=='')
		       {
		         showETip( "姓名不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/cashier_add.php", {parkId:${parkId},name:name,account:Aaccount,telephone:telephone},
			   function(data){
			       
			      if(data == '1')
			       {
			           Gdialog.close();
			           showSTip("新增成功");
			          window.location.reload();
			       }
			       if(data == '2')
			       {
			          showETip("账号 "+Aaccount +" 已经存在");
			       }
			       else
			       {
			       
			       }
		       });
	       }
	       
	       
	       function doUpdate()
	         {
	       
	           var cashierId=$('#UcashierId').val();
	           var name=$('#Uname').val();
	           var telephone=$('#Utelephone').val();
		       if($.trim(name)=='')
		       {
		         showETip( "姓名不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/cashier_update.php", {cashierId:cashierId,name:name,telephone:telephone},
			   function(data){
			       if(!data == 0)
			       {
			          Gdialog.close();
			          showSTip( "修改成功");
			          $('#'+cashierId).children().eq(0).html(name);
			          $('#'+cashierId).children().eq(2).html(telephone);
			       }else
			       {
			       
			       }
		       });
	       }
	       
	       function initModifyData(obj)
	       {
	         $('#UcashierId').val(obj.cashierId);
	         $('#Uname').val(obj.name);
	         $('#Utelephone').val(obj.telephone);
	         $('#Uaccount').val(obj.account);
	       }
	       
		</script>
	</head>
	<body>
 
	             岗亭管理[${parkName}] > 收费员管理
	            <div class="controlpanel">
		            <a class="simple_button" style="margin-left: 50px;" onclick="showDialog({id:'addPanel',title:'添加收费员',close:'closeAddDialog()'});">添加</a>
		            <a class="simple_button" style="margin-left: 50px;" href="${initParam.website}/admin/park_list.php?type=1&parentId=${parentId}">&lt;返回岗亭管理</a>
		            
	            </div>
		           <table style="margin-top: 40px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">收费员姓名</th>
		                    <th width="10%">账号</th>
		                    <th width="10%">联系电话</th>
		                    <th width="10%">所属岗亭</th>
		                    <th width="10%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="cashierList">
	                    <c:forEach var="cashier" items="${dataList}">          
		                <tr id="${cashier.cashierId}">	
		                   <td>${cashier.name }</td>
		                   <td>${cashier.account }</td>
		                   <td>${cashier.telephone }</td>
		                   <td>${parkName }</td>
		                   <td>
		                       <a href="javascript:showDialog({id:'modifyPanel',title:'修改收费员信息'}),initModifyData({cashierId:${cashier.cashierId},name:'${cashier.name}',account:'${cashier.account}',telephone:'${cashier.telephone}'})">修改</a> | 
			                   <a href="javascript:doDelete(${cashier.cashierId})">删除</a>
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="5">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" >
				    <div class="formItem"  >
		            <label>所属岗亭</label> <input type="text" style="width: 200px;" value="${parkName }" readonly="readonly" disabled="disabled"/>
		            </div>
		            <div class="formItem"  >
		            <label>账号</label> <input type="text" style="width: 200px;" id="Aaccount" />
		            </div>
				    <div class="formItem"  >
		            <label>姓名</label> <input type="text" style="width: 200px;" id="Aname" />
		            </div>
		            <div class="formItem" >
		            <label>联系电话</label> <input type="text" style="width: 200px;" id="Atelephone" />
		            </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;top: 20px;" onclick="doSave()">保存</a>
                 </div>
		   </div>
		   
		 <div  id="modifyPanel" style="display: none;">
				 <div class="form-area" >
				    <input type="hidden" style="width: 200px;" id="UcashierId" />
				    <div class="formItem"  >
		            <label>所属岗亭</label> <input type="text" style="width: 200px;" value="${parkName }" readonly="readonly" disabled="disabled"/>
		            </div>
		             <div class="formItem"  >
		            <label>账号</label> <input type="text" style="width: 200px;" id="Uaccount" readonly="readonly" disabled="disabled"/>
		            </div>
				    <div class="formItem"  >
		            <label>姓名</label> <input type="text" style="width: 200px;" id="Uname" />
		            </div>
		            <div class="formItem" >
		            <label>联系电话</label> <input type="text" style="width: 200px;" id="Utelephone" />
		            </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 100px;top: 20px;" onclick="doUpdate()">保存</a>
                 </div>
		   </div>   
		   
	</body>
</html>
