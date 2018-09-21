
 
function showTips( css,message)
 {
 
         if($('#GTip').length>0)
	    {  
	       return;
	    }
         var tip = "<div id='GTip' style=''><a id='tip_icon'/>"+message+"</div>"
         var h = $(document).height();
		 var w = $(document).width();
	     $('body').append($(tip));
	     $('#GTip').addClass(css.tip);
	     $('#tip_icon').addClass(css.icon);
	     $('#GTip').css({top:(h-40)/3,left:(w-300)/2});
	     $('#GTip').fadeIn("slow",function(){
	      window.setTimeout(function(){
	         $('#GTip').fadeOut("slow",function(){$('#GTip').remove()});
	      },2000);
	    });
}

function showSTip(message)
 {
        showTips({tip:'tip_green',icon:'icon_success'},message);
}

function showETip(message)
 {
        showTips({tip:'tip_red',icon:'icon_error'},message);
}

function fadeInTips( css,message)
{
		$('#tips').removeClass();
		$('#tips').addClass(css);
	    $('#tips').html(message);
	    $('#tips').fadeIn("slow");
}

function isEmail(str)
{
    var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if(reg.test(str)){
	  return true;
	}else{
	 return false;
	}
}

 
function checkImageType(newFileName)
{
   var type = newFileName[newFileName.length-1].toLowerCase();
	 if(type!='jpg'&&type!='png'&&type!='bmp'&& type!='jpeg'&& type!='gif')
	{
	  showTips( 'tip_red',MESSAGE.select_image_tips);
	  return false;
	}
	return true;
}
 
   function checkBrowser(){
    var ua= navigator.userAgent;
	var msie = ua.indexOf("MSIE");
	var isIE = msie > 0;
	if(isIE)
	{
		var version = parseInt(ua.substring(msie + 5, ua.indexOf(".", msie))) ;
		if(version ==6 )
		{
			alert(MESSAGE.unsupported_browse_tips);
			window.close();
		}
	}
}


//--------------           dialog -----------------------------------------------------------------------------------

 
var  Gdialog = { 
    
	show : function(setting)
	{   var h = $(document).height();
	    var w = $(document).width();
	    var mask = " <div id='global_mask' style='position: absolute;top: 0px;left: 0px;z-index: 998;background: #BED1D8;opacity: 0.5;width: 100%;height: 1000px;display: none;overflow:hidden;'></div>"
	    if($('#GDialog').length>0)
	    {  
	       Gdialog.maxsize(setting);
	       return;
	    }
	    var GDialog = "<div id='GDialog' style='width:600px;left: 150px;top:50px;height:300px;' class='g_dialog'><div  class='dialog_head dialog_head_bg dialog_sprite'><span style='margin-left:15px;'>"+setting.title+"</span><a class='dialog_resize dialog_sprite'   ></a><a class='dialog_close dialog_sprite'   ></a></div>"
				                 +"<div class='dialog_content' ></div> </div>";
				   var content = $('#'+setting.content).html();
				   $('#'+setting.content).before($(GDialog));
				   $('body').append($(mask));
				   $('#GDialog').css({top:(h-setting.height)/3,left:(w-setting.width)/2,width:setting.width,height:setting.height});
				   $('#GDialog').find('.dialog_content').html(content);
				   $('#GDialog').fadeIn();
				   $('#global_mask').show();
	     $('.dialog_close').click(function(){Gdialog.close();});
	     
	     $('.dialog_resize').click(function(){
	     if($('#GDialog').css("position")=='absolute')
	        Gdialog.minsize(setting);
	        else
	        Gdialog.maxsize(setting);
	     });
	     Gdialog.listenMove(setting);
	},
	 close : function ()
	{
	    $('#GDialog').fadeOut(function(){$(this).remove()});
	    $('#global_mask').fadeOut(function(){$(this).remove()});
	},
	 listenMove : function (setting)
	{
	     var bool=false;
         var offsetX=0;
         var offsetY=0;
	     $(".dialog_head").mousedown(function(){$(document).css('cursor','move');bool=true;offsetX = event.offsetX;offsetY = event.offsetY;}).mouseup(function(){bool=false;});
         $(document).mousemove(function(e){
            if(!bool)
                return;
                 e.preventDefault();
                $(document).css('cursor','move');
            var x = event.clientX-offsetX;
            var y = event.clientY-offsetY;
            if(x>0 && x <=$(document).width() -setting.width )
            $("#GDialog").css("left", x);
            if(y>0 && y<=$(document).height() -setting.height)
            $("#GDialog").css("top", y);
            });
	},
	maxsize :function (setting)
	{
	     var h = $(document).height();
	     var w = $(document).width();
	    $("#GDialog").css("position", "absolute");
	    $('#GDialog').css({top:(h-setting.height)/3,left:(w-setting.width)/2,width:setting.width,height:setting.height});
	    $('.dialog_resize').css("background-position","0 -162px");
	    $('#global_mask').fadeIn();
	},
	 minsize : function (setting)
	{
	    $("#GDialog").css("position", "fixed");
	    $("#GDialog").css({bottom:-(setting.height-39)});
	    $("#GDialog").css("top","auto");
	    $("#GDialog").css("left","auto");
	    $('.dialog_resize').css("background-position","0 -192px");
	    $('#global_mask').fadeOut();
	}
	
}