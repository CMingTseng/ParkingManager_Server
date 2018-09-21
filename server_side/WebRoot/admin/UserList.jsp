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
		      $.getJSON("${initParam.website}/admin/user_delete.php", {userId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showAddDialog(obj)
			{
			   
			   var setting = {width:600,height:300,content:obj.id,title:obj.title};
			  // 
               Gdialog.show(setting);
			}
			
			 
			
			 function doSave()
	         {
	       
	           var departmentId=${user.departmentId};
	           var name=$('#Aname').val();
	           var rank=$('#Arank').val();
	           var sex=$('#Asex').val();
	           var account=$('#Aaccount').val();
	           var telephone=$('#telephone').val();
		       if($.trim(name)=='')
		       {
		         showETip("用户姓名不能为空");
		         return;
		       }
		       if($.trim(account)=='')
		       {
		         showETip("用户ID不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/user_add.php", {departmentId:departmentId,name:name,account:account,rank:rank,sex:sex,telephone:telephone},
			   function(data){
			       if(data == '1')
			       {
			           Gdialog.close();
			           showSTip("新增成功");
			           $('#FormReset').click();
			           document.getElementById("searchForm").submit();
			       }
			       if(data == '2')
			       {
			          showETip("账号 "+account +" 已经存在");
			       }
			       else
			       {
			       
			       }
		       });
	       }
	       
	      function changeStatus(obj,id,status)
	      {
	         $.post("${initParam.website}/admin/user_changeStatus.php", {userId:id,status:status},
			   function(data){
			       if(status == 0)
			       {
			         
			         $(obj).parent().html("<font color='green'>正常</font> <a class='simple_button small'  onclick='changeStatus(this,"+id+",1)'>停用</a>");
			       }else
			       {
			         $(obj).parent().html("<font color='red'>停用</font> <a class='simple_button small'  onclick='changeStatus(this,"+id+",0)'>启用</a>");
			       }
		       });
	      
	      }
	       function initPower(userId,power)
	       {
	          for(i=1;i<7;i++)
	          {
		          if(power.charAt(i-1)=='1')
		          {
		            $('#'+i).val(1);
		          }else
		          {
		            $('#'+i).val(0);
		          }
	          }
	          $('#PuserId').val(userId);
	       }
	       function doSavePower()
	       {
	         var powerFlg="1,2,3,4,5,6";
	         var powerValue=$('#1').val()+$('#2').val()+$('#3').val()+$('#4').val()+$('#5').val()+$('#6').val();
	        
	           $.post("${initParam.website}/admin/user_modifyPower.php", {userId:$('#PuserId').val(),powerFlg:powerFlg,powerValue:powerValue},
			   function(data){
			       if(data != 0)
			       {
			          showSTip("权限修改成功");
			          $('#FormReset').click();
			          document.getElementById("searchForm").submit();
			       }else
			       {
			       }
		       });
	       }
	       
	       
	       function initModifyData(obj)
	       {
	         $('#UuserId').val(obj.userId);
	         $('#Uname').val(obj.name);
	         $('#Utelephone').val(obj.telephone);
	         $('#Urank').val(obj.rank);
	         $('#Usex').val(obj.sex);
	       }
	       
	        function doUpdate()
	         {
	           var userId=$('#UuserId').val();
	           var name=$('#Uname').val();
	           var rank=$('#Urank').val();
	           var sex=$('#Usex').val();
	           var telephone=$('#Utelephone').val();
		       if($.trim(name)=='')
		       {
		         showETip("用户姓名不能为空");
		         return;
		       }
		       
		       $.post("${initParam.website}/admin/user_update.php", {userId:userId,name:name,rank:rank,sex:sex,telephone:telephone},
			   function(data){
			       if(!data == '0')
			       {
			           Gdialog.close();
			           showSTip("修改成功");
			           $('#'+userId).children().eq(1).html(name);
			           $('#'+userId).children().eq(4).html(rank);
			           $('#'+userId).children().eq(5).html(telephone);
			           if(sex==1)
			           {
			           $('#'+userId).children().eq(3).html('男');
			           }else
			           {
			           $('#'+userId).children().eq(3).html('女');
			           }
			       }else
			       {
			       
			       }
		       });
	       }
		</script>
	</head>
	<body >
 
	           
	            <div class="controlpanel">
	                <form action="${initParam.website}/admin/user_list.php?user.departmentId=${user.departmentId}" method="post" id="searchForm">
		            <input type="hidden" name="currentPage" id="currentPage"/>
		            <label>账号</label><input type="text" name="user.account"  value="${user.account}"/>
		            <label>姓名</label> <input type="text" name="user.name" value="${user.name}"/>
		            <input type="reset" id="FormReset"  style="display: none;"/>
		            <a class="simple_button" style="margin-left: 50px;" onclick="document.getElementById('searchForm').submit()">查询</a>
		            </form>
	            </div>
	            <div style="height: 60px;line-height: 60px;border: 1px solid #14A7D5;width: 99%;">
		             <a class="simple_button" style="margin-left: 10px;" onclick="showAddDialog({id:'addPanel',title:'添加用户',close:'closeAddDialog()'});">添加</a>
	            </div>
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">账号</th>
		                    <th width="10%">姓名</th>
		                    <th width="20%">从属部门</th>
		                    <th width="5%">性别</th>
		                    <th width="10%">职称</th>
		                    <th width="12%">电话</th>
		                    <th width="13%">状态</th>
		                    <th width="20%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="userList">
	                    <c:forEach var="user" items="${page.dataList}">          
		                <tr id="${user.userId}">	
		                   <td>${user.account }</td>
		                   <td>${user.name }</td>
		                   <td>${department}</td>
		                   <td>  
		                   <c:if test="${user.sex eq '0'}">
		                                                   女
		                   </c:if>
		                   <c:if test="${user.sex eq '1'}">
		                                                男
		                   </c:if>
		                   </td>
		                   <td>${user.rank }</td>
		                   <td>${user.telephone }</td>
		                   <td>
		                    <c:if test="${user.status =='0'}">
		                              <font color="green">正常</font> <a class="simple_button small"  onclick="changeStatus(this,${user.userId},1)">停用</a>
		                   </c:if>
		                   <c:if test="${user.status =='1'}">
		                             <font color="red">停用</font><a class="simple_button small"  onclick="changeStatus(this,${user.userId},0)">启用</a>
		                   </c:if>
		                   
		                   
		                   </td>
		                   <td>
		                       <a href="javascript:showAddDialog({id:'modifyPanel',title:'修改用户'}),initModifyData({userId:${user.userId},name:'${user.name}',rank:'${user.rank}',sex:'${user.sex}',telephone:'${user.telephone}'})">修改</a> | 
			                   <a href="javascript:doDelete(${user.userId})">删除</a>
			                   <a class="simple_button small" style="margin-left: 10px;" onclick="showAddDialog({id:'powerPanel',title:'用户权限设置',close:'closeAddDialog()'}),initPower('${user.userId}','${user.power}');">权限</a>
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${page.count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="8">暂无记录</td>
		                 </tr>
		                </c:if>
		                
	                </tbody>
	                <tfoot>
	                  <tr>	
	                      <td colspan="8">
		                   <ui:page page="${page}"></ui:page>
		                    </td>
		                 </tr>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area"  >
				    <input type="hidden" id="AdepartmentId" value="${departmentId}"/>
		            <div class="formItem" style="float: left;" >
		            <label>用户账号</label> <input type="text" style="width: 200px;" id="Aaccount" />
		             </div>
		             <div class="formItem" style="float: left;" >
		             <label>用户姓名</label> <input type="text" style="width: 200px;" id="Aname" />
		             </div>
		             <div class="formItem" style="float: left;" >
		             <label>从属部门</label> <input type="text" style="width: 200px;" value="${department }" disabled="disabled" readonly="readonly" />
		             </div>
		             
		              <div class="formItem" style="float: left;">
		             <label>职称</label> <input type="text" style="width: 200px;" id="Arank" />
		             </div>
		              <div class="formItem"  style="float: left;">
		             <label>电话</label> <input type="text" style="width: 200px;" id="telephone" />
		             </div>
		              <div class="formItem"  >
		             <label>性别</label> <select style="height: 40px;width: 200px;" id="Asex"><option value="1" selected="selected">男</option><option value="0">女</option></select>
		             </div>
		              <div class="formItem"  >
		               <a class="simple_button" id="modifyBut" style="margin-left: 70px;" onclick="doSave()">保存</a>
		             </div>
		             
                 </div>
		   </div>
		   
		   <div  id="modifyPanel" style="display: none;">
				 <div class="form-area"  >
				     <input type="hidden" id="UuserId" />
		             <div class="formItem" style="float: left;" >
		             <label>用户姓名</label> <input type="text" style="width: 200px;" id="Uname" />
		             </div>
		              <div class="formItem" style="float: left;">
		             <label>职称</label> <input type="text" style="width: 200px;" id="Urank" />
		             </div>
		              <div class="formItem"  style="float: left;">
		             <label>电话</label> <input type="text" style="width: 200px;" id="Utelephone" />
		             </div>
		              <div class="formItem"  >
		             <label>性别</label> <select style="height: 40px;width: 200px;" id="Usex"><option value="1" selected="selected">男</option><option value="0">女</option></select>
		             </div>
		              <div class="formItem"  >
		               <a class="simple_button" id="modifyBut" style="margin-left: 70px;" onclick="doUpdate()">保存</a>
		             </div>
		             
                 </div>
		   </div>
		   
		    <div  id="powerPanel" style="display: none;">
				 <div class="form-area" style="height: 80px">
				 <input type="hidden" id="PuserId" />
				   <div class="formItem"   style="float: left;">
		            <label style="width: 100px;">机构设置</label> 
		            <select style="height: 40px;width: 150px;" id="1">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div>
		           <div class="formItem"   style="float: left;">
		            <label  style="width: 100px;">车场岗亭管理</label> 
		            <select style="height: 40px;width: 150px;" id="2">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div>
		           <div class="formItem"   style="float: left;">
		            <label  style="width: 100px;">用户管理</label> 
		            <select style="height: 40px;width: 150px;" id="3">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div>
		           <div class="formItem"  style="float: left;">
		            <label  style="width: 100px;">查询进出场报表</label> 
		            <select style="height: 40px;width: 150px;" id="4">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div>
		           <div class="formItem"   style="float: left;">
		            <label  style="width: 100px;">查询收费报表</label> 
		            <select style="height: 40px;width: 150px;" id="5">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div>
		           <div class="formItem"   style="float: left;">
		            <label  style="width: 100px;">VIP车辆管理</label> 
		            <select style="height: 40px;width: 150px;" id="6">
			            <option value="1" >允许</option>
			            <option value="0">不允许</option>
		            </select>
		           </div> 
		           <div class="formItem"  style="float: left;">
		            <a class="simple_button" id="modifyBut" style="margin-left: 150px;" onclick="doSavePower()">保存</a>
		            </div>
                 </div>
		   </div>
		 <div id="global_mask" style="position: absolute;top: 0px;left: 0px;z-index: 998;background: #BED1D8;opacity: 0.5;width: 100%;height: 600px;display: none;"></div>
		   
	</body>
</html>
