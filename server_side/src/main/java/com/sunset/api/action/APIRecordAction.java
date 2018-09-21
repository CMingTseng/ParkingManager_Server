package com.sunset.api.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.service.RecordService;
import com.sunset.core.service.StrongholdService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Record;
import com.sunset.model.Stronghold;
import com.sunset.util.SystemUtil;

public class APIRecordAction extends SuperAction implements ModelDriven<Record>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	private RecordService recordServiceImpl;
	
	@Autowired
	private DepartmentService departmentService;
    
	@Autowired
	private StrongholdService strongholdServiceImpl;
	
	private Record record = new Record();
    
	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public void setRecordServiceImpl(RecordService recordServiceImpl) {
		this.recordServiceImpl = recordServiceImpl;
	}
	
	 
	
	public void setStrongholdServiceImpl(StrongholdService strongholdServiceImpl) {
		this.strongholdServiceImpl = strongholdServiceImpl;
	}

	public void add() throws IOException
	{
		  //String userId = request.getParameter("userId");
		 // String entry = request.getParameter("entry");
		 // String carId = request.getParameter("carId");
		MultiPartRequestWrapper pr = (MultiPartRequestWrapper)request;
		if(pr.getFiles("image")!=null&&pr.getFiles("image").length > 0)
		{
		    File file = pr.getFiles("image")[0];
		    String path = ServletActionContext.getServletContext().getRealPath("recordImage");
		    File des = new File(path+"/"+record.getEntryImg());
		    FileUtil.copyFile(file, des);
		    record.setEntryImg("recordImage"+"/"+record.getEntryImg());
		}
		try{
		Stronghold s = strongholdServiceImpl.queryStrongholdById(record.getParkId());
		s = strongholdServiceImpl.queryStrongholdById(s.getParentId());
		record.setDepartmentId(s.getParentId());
		record.setParkId(s.getParkId());
		record.setParkName(s.getName());
		record.setParkCode(s.getCode());
		recordServiceImpl.addRecord(record);
		}catch(Exception e)
		{
			e.printStackTrace();
			response.getWriter().print(0);
			return ;
		}
		response.getWriter().print(1);
	}
	public void update() throws IOException
	{
		  //String userId = request.getParameter("userId");
		 // String entry = request.getParameter("entry");
		String amt = request.getParameter("amt");
		MultiPartRequestWrapper pr = (MultiPartRequestWrapper)request;
		if(pr.getFiles("image")!=null&&pr.getFiles("image").length > 0)
		{
		    File file = pr.getFiles("image")[0];
		    String path = ServletActionContext.getServletContext().getRealPath("recordImage");
		    File des = new File(path+"/"+record.getExportImg());
		    FileUtil.copyFile(file, des);
		}
		Record  t = recordServiceImpl.queryRecordById(record.getRecordId());
		t.setExport(record.getExport());
		t.setExportTime(SystemUtil.getCurrentlyDateTime());
		t.setExportImg("recordImage"+"/"+record.getExportImg());
		t.setStatus("1");
		t.setShouldAmt(amt);
		t.setRealAmt(amt);
		//t.setShouldAmt();
		try{
		recordServiceImpl.updateRecord(t);
		}catch(Exception e)
		{
			e.printStackTrace();
			response.getWriter().print(0);
			return ;
		}
		response.getWriter().print(1);
	}
	
	public void sync() throws IOException
	{
		String amt = request.getParameter("amt");
		MultiPartRequestWrapper pr = (MultiPartRequestWrapper)request;
		if(pr.getFiles("entryImg")!=null&&pr.getFiles("entryImg").length > 0)
		{
		    File file = pr.getFiles("entryImg")[0];
		    String path = ServletActionContext.getServletContext().getRealPath("recordImage");
		    File des = new File(path+"/"+record.getEntryImg());
		    FileUtil.copyFile(file, des);
		    record.setEntryImg("recordImage"+"/"+record.getEntryImg());
		}
		if(pr.getFiles("exportImg")!=null&&pr.getFiles("exportImg").length > 0)
		{
		    File file = pr.getFiles("exportImg")[0];
		    String path = ServletActionContext.getServletContext().getRealPath("recordImage");
		    File des = new File(path+"/"+record.getExportImg());
		    FileUtil.copyFile(file, des);
		    record.setExportImg("recordImage"+"/"+record.getExportImg());
		}
		try{
		Stronghold s = strongholdServiceImpl.queryStrongholdById(record.getParkId());
		s = strongholdServiceImpl.queryStrongholdById(s.getParentId());
		record.setDepartmentId(s.getParentId());
		record.setParkId(s.getParkId());
		record.setParkName(s.getName());
		record.setParkCode(s.getCode());
		record.setShouldAmt(amt);
		record.setStatus("1");
		record.setRealAmt(amt);
		recordServiceImpl.addRecord(record);
		}catch(Exception e)
		{
			e.printStackTrace();
			response.getWriter().print(0);
			return ;
		}
		response.getWriter().print(1);
	}
	
	public void query() throws IOException
	{
		Stronghold s = strongholdServiceImpl.queryStrongholdById(record.getParkId());
		s = strongholdServiceImpl.queryStrongholdById(s.getParentId());
		record = recordServiceImpl.queryByCarId(s.getParkId(),record.getCarId());
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(new Gson().toJson(record));
	}
	
	public void recordList() throws IOException
	{
		Stronghold s = strongholdServiceImpl.queryStrongholdById(record.getParkId());
		s = strongholdServiceImpl.queryStrongholdById(s.getParentId());
		record.setParkId(s.getParkId());
		List<Record> list= recordServiceImpl.queryRecordList(record);
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(new Gson().toJson(list));
	}
	
	
	public Record getModel() {
		// TODO Auto-generated method stub
		return record;
	}
	 
	 
   
}
