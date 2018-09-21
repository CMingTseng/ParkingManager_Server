 <%@ page language="java" pageEncoding="UTF-8"%>
 <%@ page import="com.sunset.model.User" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <% User user = (User)session.getAttribute("user"); %>
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ThemeBlue.css"/>
		<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/global.css"/>
		<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ucenter.css"/>
	    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
    </head>
    <body>
 <div class="leftnav" style="margin-left: -5px;">
	 <ul >
	        <% if(user.getPower().charAt(0)=='1' || user.getPower().charAt(1)=='1'||user.getPower().charAt(2)=='1'){ %>
	             <li style="text-align: left;margin-top: 10px;border-bottom: solid 1px #14A7D5;font-size: 18px;font-weight: bold">系统管理</li>
	        <%} %>
	        <% if(user.getPower().charAt(0)=='1' ){ %>
			     <li id="userMenu" class="menu" ><a href="${initParam.website}/admin/department_manage.php" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">机构管理</a></li>
		    <%} %>
		    <% if(user.getPower().charAt(2)=='1' ){ %>
		         <li id="commentMenu"  class="menu"><a href="${initParam.website}/admin/user_manage.php" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">用户管理</a></li>
		    <%} %>
		    <% if(user.getPower().charAt(1)=='1'){ %>
		        <li  style="text-align: left;margin-top: 10px;border-bottom: solid 1px #14A7D5;font-size: 18px;font-weight: bold">车场管理</li>
		        <li id="userMenu"  class="menu active"><a href="${initParam.website}/admin/park_manage.php" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">车场岗亭管理</a></li>
		    <%} %>    
			
		    <% if(user.getPower().charAt(3)=='1' || user.getPower().charAt(4)=='1'){ %>
	        <li  style="text-align: left;margin-top: 10px;border-bottom: solid 1px #14A7D5;font-size: 18px;font-weight: bold">报表查询</li>
	        <%} %>
		    <% if(user.getPower().charAt(3)=='1' ){ %>
		    <li id="matterMenu"  class="menu"><a href="${initParam.website}/admin/RecordManage.jsp?type=0&status=0" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">在场车辆报表</a></li>
			<li id="matterMenu"  class="menu"><a href="${initParam.website}/admin/RecordManage.jsp?type=0&status=1" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">出场车辆报表</a></li>
			<%} %>
		    <% if(user.getPower().charAt(4)=='1' ){ %>
		    <li id="commentMenu"  class="menu"><a href="${initParam.website}/admin/RecordManage.jsp?type=1&status=1" target="main" onclick="$('.menu').removeClass('active'),$(this).parent().addClass('active');">临时收费报表</a></li>
		    <%} %>
	 </ul>
 </div> 
 </body>
 </html>