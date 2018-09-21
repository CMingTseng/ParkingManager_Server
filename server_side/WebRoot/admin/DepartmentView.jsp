<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		 
		   function doUpdate()
		   {
		       var name=$('#Uname').val();
		       var telephone=$('#Utelephone').val();
		       var fax=$('#Ufax').val();
		       var zip=$('#Uzip').val();
		       var address=$('#Uaddress').val();
		       var description=$('#Udescription').val();
		       if($.trim(name)=='')
		       {
		         showETip("机构名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/department_update.php", {departmentId:${ department.departmentId},name:name,telephone:telephone,fax:fax,zip:zip,address:address,description:description},
			   function(data){
			      if(data == 1)
			       {
			         showSTip("保存成功");
			         window.parent.refreshNode(${department.parentId});
			       }
		       });
		   }
		    
		   function doSave()
	       {
	       
	           var parentId=$('#AparentId').val();
	           var name=$('#Aname').val();
		       var telephone=$('#Atelephone').val();
		       var fax=$('#Afax').val();
		       var zip=$('#Azip').val();
		       var address=$('#Aaddress').val();
		       var description=$('#Adescription').val();
		       if($.trim(name)=='')
		       {
		         showETip("机构名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/department_add.php", {parentId:parentId,name:name,telephone:telephone,fax:fax,zip:zip,address:address,description:description},
			   function(data){
			       if(data != 0)
			       {
			          Gdialog.close();
			          showSTip("新增成功");
			          window.parent.refreshNode(parentId);
			       }
		       });
	       }
	       function doDelete()
		   {
		      if(${ department.departmentId}==${user.departmentId})
		      {
		       showETip("不能删除顶级机构");
		       return ;
		      }
		      $.getJSON("${initParam.website}/admin/department_delete.php", {departmentId:${ department.departmentId}},
			   function(data){
			     if(data == 1)
			       {
			         showSTip("删除成功");
			         $('body').empty();
			         window.parent.refreshNode(${department.parentId});
			       }
		       });
		   }
		   function  showDialog(obj)
			{
 
			   var setting = {width:600,height:300,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			}
		 
		</script>
	</head>
	<body >
 
	            <div class="controlpanel" style="width: 95%;">
		            <a class="simple_button" style="margin-left: 50px;" onclick="showDialog({id:'addPanel',title:'添加机构',close:'closeAddDialog()'});">添加</a>
		            <a class="simple_button" id="modifyBut" style="margin-left: 50px;" onclick="doUpdate()">修改</a>
		            <a class="simple_button" id="deleteBut" style="margin-left: 50px;" onclick="doDelete()">删除</a>
	            </div>
	            
	            <div class="form-area" id="modyfyPanel" style="margin: 30px auto;width: 95%;">
	              
	               <div class="formItem"  style="margin-top: -10px;float: left;">
	                <input type="hidden" name="UparentId" disabled="disabled"  value="${department.parentId}"/>
		            <label>从属机构</label> <input type="text" disabled="disabled"  value="${ parent}"/>
		            </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>机构编号</label><input type="text" id="UdepartmentId" disabled="disabled" value="${ department.departmentId}"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>机构名称</label> <input type="text" id="Uname" value="${ department.name}" maxlength="16"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>电话号码</label> <input type="text" id="Utelephone" value="${ department.telephone}"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>传真号码</label> <input type="text" id="Ufax" value="${ department.fax}"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>邮政编码</label> <input type="text" id="Uzip" value="${ department.zip}"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>通信地址</label> <input type="text" id="Uaddress" value="${ department.address}"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>备注</label> <input type="text" id="Udescription" value="${department.description}"/>  
		             </div>
              </div>
              
 
				 <div  id="addPanel" style="display: none;">
				 <div class="form-area" style="height: 259px;">
	             <form action="${initParam.website}/admin/department_search.php" method="post" id="searchForm">
	               <div class="formItem" style=" float: left;">
	                <input type="hidden" id="AparentId" value="${department.departmentId}"/>
		            <label>从属机构</label> <input type="text" style="width: 200px;" disabled="disabled"  value="${ department.name}"/>
		            </div>
		            <div class="formItem" style=" float:right;">
		            <label>机构名称</label> <input type="text" style="width: 200px;" id="Aname" maxlength="16"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>电话号码</label> <input type="text" id="Atelephone" style="width: 200px;"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: right;">
		            <label>传真号码</label> <input type="text" id="Afax" style="width: 200px;"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		            <label>邮政编码</label> <input type="text" id="Azip" style="width: 200px;"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: right;">
		            <label>通信地址</label> <input type="text" id="Aaddress" style="width: 200px;"/>
		             </div>
		             <div class="formItem" style="margin-top: -10px;float: left;">
		             <label>备注</label> <input type="text" id="Adescription" />  
		             </div>
		             <div class="formItem" style=" float: right;">
		                <a class="simple_button" id="modifyBut" style="margin-left: 50px;" onclick="doSave()">保存</a>
		             </div>
		         </form>
              </div>
		   </div>
	</body>
</html>
