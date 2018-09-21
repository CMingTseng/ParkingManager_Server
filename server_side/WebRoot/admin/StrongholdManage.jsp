<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html>
	<head>
		<title></title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>  
		<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/context.css"/>
		<link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/ucenter.css"/>
	</head>
	<body>
 
			  <jsp:include page="tree.jsp">
			      <jsp:param name="path" value="${initParam.website}/admin/park_list.php?type=0&parentId="/>
			   </jsp:include>
			   <div class="rightcontent"> 
	           <iframe id="testIframe" name="testIframe" frameborder=0 scrolling="no" width="100%"  onload="loadReady();" />
		      </div>
	</body>
</html>
