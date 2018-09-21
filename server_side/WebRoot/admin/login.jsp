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
    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="${initParam.website}/theme/framework.js"></script> 	
		 <script >
		 
		 document.onkeydown=function(event){
            var e = event || window.event || arguments.callee.caller.arguments[0];
             if(e && e.keyCode==13){  
                doLogin();
             }
            
        }; 
        
		 function doLogin(){
		    var account = $('#account').val();
		    var password = $('#password').val();
		    if($.trim(account)=='')
		    {
		      showETip("请输入账号");
		      return ;
		    }
		    if($.trim(password)=='')
		    {
		      showETip("请输入密码");
		      return ;
		    }
		    document.getElementById('loginForm').submit();
		 }
		 
		 
		 </script>
	</head>
	<body style="background-color: #E7F0F7;">
	        <div class="logo"></div>
		<div class="wrap" style="height: 443px;position: absolute;margin-top: 100px;background-image: url(${initParam.website}/theme/image/loginbg.png);">
			 <div class="login_panel" style="height: 250px;width: 350px;margin: 50px auto;">
				    <form action="${initParam.website}/admin/user_login.php" id="loginForm" method="post">   
		        	<div class="form-area" style="margin: 0 auto;">
		        	    <div class="formItem" style="height: 40px;"><div id="tips" class="${css}" style="width: 330px;padding: 0px;margin-top: -10px;">${message}</div></div>
			            <div class="formItem" style="margin-top: -20px;">
			            <label for="user.email">账号：</label>
			            <input type="text" maxlength="32" id="account" style="width: 230px;" name="user.account" /></div>
			            <div class="formItem">
			            <label for="user.password">密码：</label>
			            <input type="password" maxlength="16"  style="width: 230px;" id="password" name="user.password"/>
			            </div>
			             <div style="line-height: 50px;text-align: center;" class="formItem">
							<span  class="simple_button" onclick="doLogin()"> 登 录</span>
						</div>
		           </div>
		           </form>
        </div>
        </div>
       <div style="position: fixed;bottom: 30px;width: 100%;">
	       <div id="copyright" style="text-align: center;line-height: 10px;">
			<p id="tencentNav">
				Copyright © 2003 - 2013 ***.com All Rights Reserved.
			</p>
			<p id="copyRightCn">
				苏ICP备*******号 ****科技公司版权所有
			</p>
		   </div>
	   </div>
	</body>
</html>
