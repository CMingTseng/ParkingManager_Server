package com.sunset.core.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sunset.model.User;

public class SuperAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public HttpServletRequest request;
	public HttpServletResponse response;
	public HttpSession session;
	 
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	public HttpServletResponse getResponse() {
		return  ServletActionContext.getResponse();
	}
	public HttpSession getSession() {
		return  ServletActionContext.getRequest().getSession();
	}
	 
	public void validate()  
	{
		if(null==request)
		request = ServletActionContext.getRequest();
		if(null==response)
		response = ServletActionContext.getResponse();
		if(null==session)
		session = request.getSession();
		 
	}
	
	 
}
