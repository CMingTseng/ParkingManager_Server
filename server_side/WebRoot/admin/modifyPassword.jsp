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
		   
	      
			 function doSave()
	         {
	       
	           var oldPassword=$('#oldPassword').val();
	           var newPassword=$('#newPassword').val();
		       if($.trim(oldPassword)=='')
		       {
		         showETip("旧密码不能为空");
		         return;
		       }
		       if($.trim(newPassword)=='')
		       {
		          showETip("新密码不能为空");
		         return;
		       }
		       $.post("${initParam.website}/admin/user_modifyPassword.php", {oldPassword:oldPassword,newPassword:newPassword},
			   function(data){
			       if(data=='0')
			       {
			           showSTip("修改成功");
			       }
			        if(data=='1')
			       {
			           showETip("旧密码不正确");
			       }
		       });
	       }
	       
	     
	       
		</script>
	</head>
	<body>
 
				 <div class="form-area"  style="width: 400px;margin: 50px auto;">
				    <form action="${initParam.website}/admin/user_update.php" id="userForm" method="post">   
				    
		              <div class="formItem"  >
		             <label>旧密码</label> <input type="password" style="width: 200px;" name="oldPassword"  id="oldPassword" />
		             </div>
		              <div class="formItem"  >
		             <label>新密码</label> <input type="password" style="width: 200px;" name="newPassword"  id="newPassword"/>
		             </div>
		              
		              <div class="formItem"  >
		               <a class="simple_button" id="modifyBut" style="margin-left: 70px;" onclick="doSave()">保存</a>
		             </div>
		             </form>
                 </div>
		   
	</body>
</html>
