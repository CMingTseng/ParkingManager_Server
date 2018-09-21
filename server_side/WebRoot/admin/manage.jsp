  <%@ page language="java" pageEncoding="UTF-8"%>
 <%@ page import="com.sunset.model.User" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <% User user = (User)session.getAttribute("user"); %>
 
 <frameset rows="95,*,50"  frameborder="NO" border="0" framespacing="0">
	  <frame src="top.jsp" noresize="noresize" frameborder="no" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
	  <frameset cols="230,*"   id="frame">
		<frame src="menu.jsp" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
		<frame   <% if(user.getPower().charAt(1)=='1'){ %>src="park_manage.php"<%} %> name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
	  </frameset>
	  <frame src="foot.jsp" noresize="noresize" frameborder="no" name="footFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" /> 
  </frameset>
