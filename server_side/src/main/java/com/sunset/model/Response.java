package com.sunset.model;

import java.io.Serializable;
import java.util.List;

public class Response implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int key = 0;
    private User user;
    private Department comment;
    private Page page;
    private List<?> dataList;
    private String message;
    
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<?> getDataList() {
		return dataList;
	}

	public void setDataList(List<?> dataList) {
		this.dataList = dataList;
	}

	 

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Department getComment() {
		return comment;
	}

	public void setComment(Department comment) {
		this.comment = comment;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	 
}
