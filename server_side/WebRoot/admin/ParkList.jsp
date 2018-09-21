<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ page import="com.sunset.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tld/SuperTag.tld"  prefix="ui" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <% User user = (User)session.getAttribute("user"); %>
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
		      $.getJSON("${initParam.website}/admin/park_delete.php", {parkId:id},
			   function(data){
			     $('#'+id).fadeOut().fadeIn().fadeOut();
		       });
		   }
		   function  showAddDialog(obj)
			{
	 
			   var setting = {width:600,height:300,content:obj.id,title:obj.title};
			   
               Gdialog.show(setting);
			}
			
		 
			
			 function doSave()
	         {
	       
	           var Acountry=$('#Acountry').val();
	           var name=$('#Aname').val();
	           var Acity=$('#Acity').val();
	           var Acar=$('#Acar').val();
	           var AparkId=$('#AparkId').val();
	           var Aregion=$('#Aregion').val();
		       if($.trim(Acountry)=='')
		       {
		         showETip("国别号码不能为空");
		         return;
		       }
		       if($.trim(Acity)=='')
		       {
		         showETip("城市区号不能为空");
		         return;
		       }
		       if($.trim(Acar)=='')
		       {
		         showETip("车牌代码不能为空");
		         return;
		       }
		       if($.trim(AparkId)=='')
		       {
		         showETip("车场号码不能为空");
		         return;
		       }
		       if($.trim(name)=='')
		       {
		         showETip("车场名称不能为空");
		         return;
		       }
		       var code = Acountry+Acity+Acar+AparkId;
		       $.post("${initParam.website}/admin/park_add.php?type=0", {parentId:${departmentId},name:name,code:code,region:Aregion},
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
	       
	           var parkId=$('#UparkId').val();
	           var name=$('#Uname').val();
	           var region=$('#Uregion').val();
		       if($.trim(name)=='')
		       {
		         showETip("车场名称不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/park_update.php", {parkId:parkId,name:name,region:region},
			   function(data){
			       if(!data == 0)
			       {
			          Gdialog.close();
			          showSTip("修改成功");
			          $('#'+parkId).children().eq(1).html(name);
			          $('#'+parkId).children().eq(3).html(region);
			       }else
			       {
			       
			       }
		       });
	       }
	       
	         function initModifyData(obj)
	       {
	         $('#UparkId').val(obj.parkId);
	         $('#Uname').val(obj.name);
	         $('#Uregion').val(obj.region);
	       }
	       
		</script>
	</head>
	<body>
 
	              ${department } > 车场管理
	            <div class="controlpanel">
	              <form action="${initParam.website}/admin/park_list.php?type=0&parentId=${departmentId}" method="post" id="searchForm">
		            <input type="hidden" name="currentPage" id="currentPage"/>
		          </form>
		            <a class="simple_button" style="margin-left: 50px;" onclick="showAddDialog({id:'addPanel',title:'添加车场',close:'closeAddDialog()'});">添加</a>
		            <a style="padding: 10px 100px;line-height: 40px;margin-left: 50px;" id="tips"></a>
	            </div>
		           <table style="margin-top: 20px;" class="utable">
	            	<thead>
		                <tr>
		                    <th width="10%">车场编号</th>
		                    <th width="10%">车场名称</th>
		                    <th width="10%">所属机构</th>
		                    <th width="10%">所在位置</th>
		                    <th width="25%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="parkList">
	                    <c:forEach var="park" items="${page.dataList}">          
		                <tr id="${park.parkId}">	
		                   <td>${park.code }</td>
		                    <td>${park.name }</td>
		                   <td>${department }</td>
		                   <td>${park.region }</td>
		                   <td>
		                       <a href="javascript:showAddDialog({id:'modifyPanel',title:'修改车场信息',close:'closeAddDialog()'}),initModifyData({parkId:${park.parkId},name:'${park.name}',region:'${park.region}'})">修改</a> | 
			                   <a href="javascript:doDelete(${park.parkId})">删除</a> | 
			                   <a href="${initParam.website}/admin/feeRule_list.php?parkId=${park.parkId}">收费规则管理</a> |
			                   <a href="${initParam.website}/admin/park_list.php?type=1&parentId=${park.parkId}">岗亭管理</a> | 
			                    <% if(user.getPower().charAt(5)=='1' ){ %>
			                       <a href="${initParam.website}/admin/vip_list.php?parkId=${park.parkId}">VIP车辆管理</a> 
		                       <%} %>  
		                   </td>
		                </tr>
		                </c:forEach>
		                <c:if test="${page.count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="5">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                  <tr>	
	                      <td colspan="5">
		                   <ui:page page="${page}"></ui:page>
		                    </td>
		                 </tr>
	                </tfoot>
	            </table>
		 
		 
		  <div  id="addPanel" style="display: none;">
				 <div class="form-area" style="height: 260px">
				    <div class="formItem" style=" float: left;">
		            <label>国别号码</label> <input type="text" style="width: 200px;" id="Acountry" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>城市区号</label> <input type="text" style="width: 200px;" id="Acity" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>车牌代码</label> <input type="text" style="width: 200px;" id="Acar" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>车场编号</label> <input type="text" style="width: 200px;" id="AparkId" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>车场名称</label> <input type="text" style="width: 200px;" id="Aname" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>所在位置</label> <input type="text" style="width: 200px;" id="Aregion" />
		            </div>
		             <a class="simple_button" id="modifyBut" style="margin-left: 250px;top: 20px;" onclick="doSave()">保存</a>
                 </div>
		   </div>
		   
		    <div  id="modifyPanel" style="display: none;">
		    <div class="form-area">
		         <input type="hidden" style="width: 200px;" id="UparkId" />
				 <div class="formItem" style=" float: left;">
		            <label>车场名称</label> <input type="text" style="width: 200px;" id="Uname" />
		            </div>
		            <div class="formItem" style=" float: left;">
		            <label>所在位置</label> <input type="text" style="width: 200px;" id="Uregion" />
		            </div>
		            <a class="simple_button" id="modifyBut" style="margin-left: 250px;top: 20px;" onclick="doUpdate()">保存</a>
		     </div>
		   </div>
		 <div id="global_mask" style="position: absolute;top: 0px;left: 0px;z-index: 998;background: #BED1D8;opacity: 0.5;width: 100%;height: 600px;display: none;"></div>
		   
	</body>
</html>
