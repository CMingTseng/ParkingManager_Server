 <%@ page language="java" pageEncoding="UTF-8"%>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
	    <link rel="stylesheet" href="${initParam.website}/three/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
	    <script type="text/javascript" src="${initParam.website}/theme/jquery-1.8.3.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="${initParam.website}/theme/css/global.css"/>
	    <script type="text/javascript" src="${initParam.website}/three/js/jquery.ztree.core-3.4.js"></script>
	    <style>
           .treeHeader{
                background-color: #CDDFE7;
                width: 100%;
				height: 30px;
				line-height: 30px;
				text-indent: 30px;
				display: block;
				font-weight: 600;
           }
        </style>
	      <script type="text/javascript" >
	      var demoIframe;
          var setting = {
			async: {
				enable: true,
				type: "post",
				url:"${initParam.website}/admin/department_jsonList.php",
				autoParam:["id"]
				 
			},
			callback: {
				beforeClick: function(treeId, treeNode) {
					 //demoIframe.attr("src",treeNode.file);
					 if(!('${param.u}'=='t' && ${sessionScope.user.departmentId}==treeNode.id))
					 {
					   demoIframe.attr("src",'${param.path}'+treeNode.id);
					 }
					 return true;
				},
				onAsyncSuccess:function(event, treeId, treeNode, msg){
				
				   if(treeNode==undefined)
				   {
				        $('#tree_1_a').click();
				        var obj =  eval('(' + msg + ')'); 
				        refreshNode(obj.id);
				   }
				}
		    }
		};

		$(document).ready(function(){
			$.fn.zTree.init($("#tree"), setting);
			demoIframe = $("#testIframe");
		});
		
		function loadReady(){
			demoIframe = $("#testIframe");
			var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
			htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
			maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
			h = demoIframe.height() >= maxH ? minH:maxH ;
			if (h < 600) {
		  	   h = 600;
			}else
			{
			 h+=50;
			}
			demoIframe.height(h);
			$('#treeDIV').height(h+20);
		}
		
		function refreshNode(pid)
		{
		  var node = $.fn.zTree.getZTreeObj("tree").getNodeByParam("id",pid);
		  $.fn.zTree.getZTreeObj("tree").reAsyncChildNodes(node, "refresh");
		}
    </script>
    <div id="treeDIV" style="float: left;width: 230px;min-height: 600px;border-right: solid 1px #14A7D5;" class="geziBg">
     <a class="treeHeader">机构列表</a>
	 <ul id="tree" class="ztree" style="width:230px; overflow:auto;"></ul>
   </div> 
