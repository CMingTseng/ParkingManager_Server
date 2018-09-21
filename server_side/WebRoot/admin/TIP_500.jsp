<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tld/SuperTag.tld"  prefix="ui" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
	<head>
		<title></title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>  
		     <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ThemeBlue.css"/>
        <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/button.css"/>
	 <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/global.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/form.css"/>
	<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ucenter.css"/>
     <script>
     if (window.top!=window.self)
     {

          window.top.location.href = "${initParam.website}/admin/TIP_500.jsp";
     }
     
     </script>
	</head>
	<body style="background-color: #E7F0F7;">
		<div class="wrap" class="flashDIV" style="height: 443px;text-align:center; position: absolute;margin-top: 100px;background-image: url(${initParam.website}/theme/image/loginbg.png);">
			 <h1 style="line-height: 400px;color: red;"> 操作有误，<a href="login.jsp">请重新登录</a></h1>
        </div>
       <div style="position: fixed;bottom: 30px;width: 100%;">
	       <div id="copyright" style="text-align: center;line-height: 10px;">
			<p id="tencentNav">
				Copyright © 2003 - 2013 sunset.net All Rights Reserved.
			</p>
			<p id="copyRightCn">
				粤ICP备11068326号 默照科技旗下网站，版权所有
			</p>
		   </div>
	   </div>
	</body>
</html>
