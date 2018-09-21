<%@ page language="java"  pageEncoding="UTF-8"  %>
<%@ page import="com.sunset.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
	<head>
    <link rel="shortcut icon" href="${initParam.website}/page/global/favicon.ico"/>
     <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ThemeBlue.css"/>
    <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/button.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/global.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ucenter.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/form.css"/>
    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
    </head>
    <body>
    <div id="header" class="geziBg">
	    <div class="logobanner">
	            <div class="logo">
	            </div>
			    <div class="wrap clearfix">
			         <img src="${initParam.website}/theme/image/top_banner.png" style="margin-top: 15px;margin-left: 300px;"/>
			        <div class="topnav" style="margin-top: 50px;margin-right: 20px;font-size: 16px;">
			        	 欢迎您,${sessionScope.user.account}  <a href="${initParam.website}/admin/modifyPassword.jsp" target="main" >[修改密码]</a>  |  <a style="color:red;" onClick="parent.location.href='${initParam.website}/admin/user_logout.php'">[退出]</a>
                    </div>
			
			    </div>
		</div>
		<div class="tapmain" id="TOP_NAV">
		</div>
	</div>
	</body>
	</html>