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
		      $.getJSON("${initParam.website}/admin/feeRule_delete.php", {ruleId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		    function  showAddDialog(obj)
			{
			   var setting = {width:700,height:380,content:obj.id,title:obj.title};
               Gdialog.show(setting);
			   
			}
			
			 
			 function doSave()
	         {
	           var carType=$('#AcarType').val();
	           var freeTime=$('#AfreeTime').val();
	           var maxFee=$('#AmaxFee').val();
	           var firstTime=$('#AfirstTime').val();
	           var firstPrice=$('#AfirstPrice').val();
	           var spaceTime=$('#AspaceTime').val();
	           var spacePrice=$('#AspacePrice').val();
		       if($.trim(carType)=='')
		       {
		         showETip("车辆类型不能为空");
		         return;
		       }
		       if($.trim(firstTime)=='')
		       {
		         showETip("首段时长不能为空");
		         return;
		       }
		       if($.trim(firstPrice)=='')
		       {
		         showETip("首段价格不能为空");
		         return;
		       }
		       if($.trim(spaceTime)=='')
		       {
		         showETip("间隔时长不能为空");
		         return;
		       }
		       if($.trim(spacePrice)=='')
		       {
		         showETip("间隔单价不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/feeRule_add.php?type=0", {parkId:${parkId},carType:carType,freeTime:freeTime,maxFee:maxFee,firstTime:firstTime,firstPrice:firstPrice,spaceTime:spaceTime,spacePrice:spacePrice},
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
	       
	           var carType=$('#UcarType').val();
	           var ruleId=$('#UfeeRuleId').val();
	           var freeTime=$('#UfreeTime').val();
	           var maxFee=$('#UmaxFee').val();
	           var firstTime=$('#UfirstTime').val();
	           var firstPrice=$('#UfirstPrice').val();
	           var spaceTime=$('#UspaceTime').val();
	           var spacePrice=$('#UspacePrice').val();
		       if($.trim(carType)=='')
		       {
		         showETip("车辆类型不能为空");
		         return;
		       }
		       if($.trim(firstTime)=='')
		       {
		         showETip("首段时长不能为空");
		         return;
		       }
		       if($.trim(firstPrice)=='')
		       {
		         showETip("首段价格不能为空");
		         return;
		       }
		       if($.trim(spaceTime)=='')
		       {
		         showETip("间隔时长不能为空");
		         return;
		       }
		       if($.trim(spacePrice)=='')
		       {
		         showETip("间隔单价不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/feeRule_update.php?type=0", {ruleId:ruleId,parkId:${parkId},carType:carType,freeTime:freeTime,maxFee:maxFee,firstTime:firstTime,firstPrice:firstPrice,spaceTime:spaceTime,spacePrice:spacePrice},
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
	         $('#UfeeRuleId').val(obj.ruleId);
	         $('#UcarType').val(obj.carType);
	         $('#UfreeTime').val(obj.freeTime);
	         $('#UmaxFee').val(obj.maxFee);
	         $('#UfirstTime').val(obj.firstTime);
	         $('#UfirstPrice').val(obj.firstPrice);
	         $('#UspaceTime').val(obj.spaceTime);
	         $('#UspacePrice').val(obj.spacePrice);
	       }
		</script>
	</head>
	<body>
 
	              车场管理[${parkName }] > 收费规则管理
	            <div class="controlpanel">
	              <form action="${initParam.website}/admin/feeRule_list.php?type=0?parentId=${departmentId}" method="post" id="searchForm">
		            <input type="hidden" name="currentPage" id="currentPage"/>
		          </form>
		            <a class="simple_button" style="margin-left: 50px;" onclick="showAddDialog({id:'addPanel',title:'添加收费规则',close:'closeAddDialog()'});">添加</a>
		            <a class="simple_button" style="margin-left: 50px;" href="${initParam.website}/admin/park_list.php?type=0&parentId=${departmentId}">&lt;返回车场管理</a>
		            <a style="padding: 10px 100px;line-height: 40px;margin-left: 50px;" id="tips"></a>
	            </div>
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">车辆类型</th>
		                    <th width="10%">收费方式</th>
		                    <th width="10%">免费时长</th>
		                    <th width="10%">每天限额</th>
		                    <th width="10%">首段时长</th>
		                    <th width="10%">首段单价</th>
		                    <th width="10%">间隔时长</th>
		                    <th width="10%">间隔单价</th>
		                    <th width="20%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="feeRuleList">
	                    <c:forEach var="feeRule" items="${dataList}">          
		                <tr id="${feeRule.ruleId}">	
		                   <td>${feeRule.carType }</td>
		                   <td>按时收费</td>
		                   <td>${feeRule.freeTime }</td>
		                   <td>${feeRule.maxFee }</td>
		                   <td>${feeRule.firstTime }</td>
		                   <td>${feeRule.firstPrice }</td>
		                   <td>${feeRule.spaceTime }</td>
		                   <td>${feeRule.spacePrice }</td>
		                   <td>
		                       <a href="javascript:showAddDialog({id:'modifyPanel',title:'修改收费规则',close:'closeAddDialog()'}),initModifyData({ruleId:${feeRule.ruleId },carType:'${feeRule.carType }',freeTime:'${feeRule.freeTime }',maxFee:'${feeRule.maxFee }',firstTime:'${feeRule.firstTime }',firstPrice:'${feeRule.firstPrice }',spaceTime:'${feeRule.spaceTime }',spacePrice:'${feeRule.spacePrice }'})">修改</a> | 
			                   <a href="javascript:doDelete(${feeRule.ruleId})">删除</a> 
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="9">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" style="height: 260px">
				 <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">所属车场</label> <input type="text" style="width: 200px;" value="${parkName }"  readonly="readonly"  disabled="disabled"/> 
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">车辆类型</label> <input type="text" style="width: 200px;" id="AcarType" />
		            </div>
				    <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">免费时长(分钟)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AfreeTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">最高限额(元)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AmaxFee" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">首段时长(分钟)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AfirstTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">首段金额(元)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AfirstPrice" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">间隔时长(分钟)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AspaceTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">间隔单价(元)</label> <input onkeyup="if(isNaN(value))execCommand('undo')" type="text" style="width: 200px;" id="AspacePrice" />
		            </div>
		            <div class="formItem" style=" float: left;">
		             <a class="simple_button" id="modifyBut" style="margin-left: 250px;" onclick="doSave()">保存</a>
		            </div>
		             
                 </div>
		   </div>
		   
		    <div  id="modifyPanel" style="display: none;">
		    <div class="form-area" style="height: 260px">
		         <input type="hidden" style="width: 200px;" id="UfeeRuleId" />
				 <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">所属车场</label> <input type="text" style="width: 200px;" value="${parkName }"  readonly="readonly"  disabled="disabled"/> 
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">车辆类型</label> <input type="text"  style="width: 200px;" id="UcarType" />
		            </div>
				    <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">免费时长(分钟)</label> <input type="text" onkeyup="if(isNaN(value))execCommand('undo')" style="width: 200px;" id="UfreeTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">最高限额(元)</label> <input type="text" onkeyup="if(isNaN(value))execCommand('undo')" style="width: 200px;" id="UmaxFee" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">首段时长(分钟)</label> <input type="text" onkeyup="if(isNaN(value))execCommand('undo')" style="width: 200px;" id="UfirstTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">首段金额(元)</label> <input type="text" onkeyup="if(isNaN(value))execCommand('undo')" style="width: 200px;" id="UfirstPrice" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">间隔时长(分钟)</label> <input type="text" onkeyup="if(isNaN(value))execCommand('undo')" style="width: 200px;" id="UspaceTime" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label style="width: 100px;">间隔单价(元)</label> <input type="text" style="width: 200px;" id="UspacePrice" />
		            </div>
		            <div class="formItem" style=" float: left;">
		             <a class="simple_button" id="modifyBut" style="margin-left: 250px;" onclick="doUpdate()">保存</a>
		            </div>
		     </div>
		   </div>
		 <div id="global_mask" style="position: absolute;top: 0px;left: 0px;z-index: 998;background: #BED1D8;opacity: 0.5;width: 100%;height: 600px;display: none;"></div>
		   
	</body>
</html>
