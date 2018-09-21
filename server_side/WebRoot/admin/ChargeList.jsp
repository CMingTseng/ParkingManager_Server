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
		<link rel="stylesheet" type="text/css" href="${initParam.website}/jQueryDateInput/date_input.css"/>
    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${initParam.website}/theme/framework.js"></script>
    <script type="text/javascript" src="${initParam.website}/jQueryDateInput/jquery.date_input.js"></script>
		<script type="text/javascript">
           function gotoPage(number)
	       {
	         $('#currentPage').val(number);
	          document.getElementById("searchForm").submit();
	       }
	       function  showPICDialog(obj)
			{
			   var setting = {width:400,height:480,content:obj.id,title:obj.title};
               Gdialog.show(setting);
			   
			}
			function initData(rukuImg,chukouImg)
			{
			   $('#rukouImg').attr('src',"${initParam.website}/"+rukuImg);
			   $('#chukouImg').attr('src',"${initParam.website}/"+chukouImg);
			}
			
			function doBDelete()
			{
			    
			     var len  = $("input[name='DCOX']:checked").length;
			     if(len==0)
			     {
				      showETip("没有要删除的记录!");
				      return ;
			     }
			     var ids="";
			     $("input[name='DCOX']:checked").each(
		                function() {
		                      ids+=$(this).attr("value")+","
		                }
                 );
                 if(confirm("确定删除这"+len+"条记录吗"))
                 {
                   $.post("${initParam.website}/admin/record_batchDelete.php", {ids:ids},
					   function(data){
					       if(data == '1')
					       {
					           showSTip("删除成功");
					           document.getElementById('searchForm').submit();
					       }else
					       {
					          showSTip("删除失败");
					       }
					        
				       });
                 }
                 
			}
			function selectGCBOX()
			{
			     var c  = $('#GCBOX').attr('checked');
			     if(c=='checked')
			     {
			       $('input[name=DCOX]').attr('checked','checked');
			     }else
			     {
			      $('input[name=DCOX]').removeAttr('checked');
			     }
			   
			}
			jQuery.extend(DateInput.DEFAULT_OPTS, {   
			month_names: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],   
			short_month_names: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],   
			short_day_names: ["一", "二", "三", "四", "五", "六", "日"],  
			 dateToString: function(date) {  
			    var month = (date.getMonth() + 1).toString();  
			    var dom = date.getDate().toString();  
			    if (month.length == 1) month = "0" + month;  
			    if (dom.length == 1) dom = "0" + dom;  
			    return date.getFullYear() + "-" + month + "-" + dom;  
			  }  
			  
			});   
		$(function() {   
		$("#SEntryTime").date_input();  
		$("#SExportTime").date_input();
		$("#EEntryTime").date_input();  
		$("#EExportTime").date_input();    
		});   
		</script>
	</head>
	<body style="padding: 5px;">
 
	           
	            <div class="controlpanel"  style="height: 100px;line-height: 33px;">
	                <form action="${initParam.website}/admin/record_list.php" method="post" id="searchForm">
		            <input type="hidden" name="currentPage" id="currentPage"/>
		            <input type="hidden" name="record.departmentId" value="${record.departmentId}"/>
		            <input type="hidden" name="record.type" value="1"/>
		            <input type="hidden" name="record.status" value="1"/>
		            <label>车场编号 </label><input type="text" style="width: 150px;height: 25px;" name="record.parkCode" value="${record.parkCode}"/>
		            <label>车牌号码 </label><input maxlength="7" type="text" style="width: 150px;height: 25px;" name="record.carId" value="${record.carId}"/>
		            <label>操作人员 </label> <input type="text" style="width: 150px;height: 25px;" name="record.userId" value="${record.userId}"/></br>
		            <label>入场时间 </label><input readonly="readonly" type="text"  style="width: 150px;height: 25px;" id="SEntryTime" name="record.starEntryTime"  value="${record.starEntryTime}"/>
		            <label>-—至—-</label> <input readonly="readonly" type="text"  style="width: 150px;height: 25px;" id="EEntryTime" name="record.endEntryTime" value="${record.endEntryTime}"/> </br>
		            <label>出场时间 </label><input readonly="readonly" type="text"  style="width: 150px;height: 25px;" id="SExportTime" name="record.starExportTime"  value="${record.starExportTime}"/>
		            <label>-—至—-</label> <input readonly="readonly" type="text"  style="width: 150px;height: 25px;" id="EExportTime" name="record.endExportTime" value="${record.endExportTime}"/>
		            <a class="simple_button" style="margin-left: 70px;top: -10px;" onclick="document.getElementById('searchForm').submit()">查询</a>
		            </form>
	            </div>
	            
	              <div style="border: solid 1px #D4D4D4;margin-top: 20px;height: 32px;background: white;">
	               <a style="width: 80px;line-height: 32px;" class="redButton" href="javascript:doBDelete()">删 除</a>
	               </div>
		           <table  class="utable">
	            	<thead>
		                <tr>
		                    <th width="3%"><input type="checkbox" id="GCBOX" onclick="selectGCBOX()"/></th>
		                    <th width="12%">车场编号</th>
		                    <th width="13%">车场名称</th>
		                    <th width="7%">车牌号</th>
		                    <th width="12%">入场时间</th>
		                    <th width="6%">入口</th>
		                    <th width="12%">出场时间</th>
		                    <th width="6%">出口</th>
		                    <th width="7%">应收费用</th>
		                    <th width="7%">实际收费</th>
		                    <th width="6%">操作员</th>
		                    <th width="5%">操作</th>
		                </tr>
	                </thead>
	                <tbody id="recordList">
	                    <c:forEach var="record" items="${page.dataList}">          
		                <tr id="${record.recordId}">	
		                   <td><input type="checkbox" value="${record.recordId}" name="DCOX" /></td>
		                   <td>${record.parkCode }</td>
		                   <td>${record.parkName }</td>	
		                   <td>${record.carId }</td>
		                   <td>${record.entryTime }</td>
		                   <td>${record.entry}</td>
		                   <td>${record.exportTime }</td>
		                   <td>${record.export}</td>
		                   <td>${record.shouldAmt}</td>
		                   <td>${record.realAmt }</td>
		                   <td>${record.userId }</td>
		                   <td><a href="javascript:showPICDialog({'id':'PICPanel','title':'图片浏览'}),initData('${record.entryImg}','${record.exportImg}');">查看</a></td>
		                </tr>
		                </c:forEach>
		                <c:if test="${page.count==0}">
		                 <tr id="noDataTr">	
		                   <td colspan="12">暂无记录</td>
		                </tr>
		                </c:if>
	                </tbody>
	                <tfoot>
	                <tr>	
	                      <td colspan="12">
		                   <ui:page page="${page}"></ui:page>
		                    </td>
		                 </tr>
	                </tfoot>
	            </table>
		   	            
		    <div  id="PICPanel" style="display: none;">
				  
				  <img src="" id="rukouImg"  height="200px" style="margin: 0 auto;"/>入场图片
				  <hr />
				  <img src="" id="chukouImg" height="200px"/>出场图片
		   </div>
	</body>
</html>
