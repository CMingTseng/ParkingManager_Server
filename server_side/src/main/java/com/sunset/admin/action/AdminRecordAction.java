package com.sunset.admin.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.service.RecordService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Page;
import com.sunset.model.Record;
import com.sunset.util.SystemUtil;

public class AdminRecordAction extends SuperAction implements ModelDriven<Record>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Autowired
	private RecordService recordServiceImpl;
	
	@Autowired
	private DepartmentService departmentService;
    
	
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
	
	 
	
	public String list() throws IOException
	{
		 
		 Page page =  new Page();
		 String pageIndex = request.getParameter("currentPage");
		 int currentPage = 1;
		 if(!SystemUtil.isEmpty(pageIndex))
		 {
			 currentPage = Integer.parseInt(pageIndex);
		 }
		 page.setCurrentPage(currentPage);
		if(record==null)
			record = new Record();
		
		recordServiceImpl.queryRecordByPage(record,page);
		if(page.getDataList()!=null&&page.getDataList().size()>0)
		{
			
			for(int i = 0;i<page.getDataList().size();i++)
			{
				Record r = (Record) page.getDataList().get(i);
				r.setEntryTime(SystemUtil.dateToDate(r.getEntryTime()));
				r.setExportTime(SystemUtil.dateToDate(r.getExportTime()));
			}
		}
		request.setAttribute("page",page);
		request.setAttribute("record",record);
		if(record.getType().equals("0"))
		{
			if("0".equals(record.getStatus()))
			return "Arecordlist";
			else
				return "Frecordlist";	
		}else
		{
			return "chargelist";
		}
	}
	 
	public void batchDelete() throws IOException
	{
		 String[] ids = request.getParameter("ids").split(",");
		 try{
			 for(String id : ids)
			 {
				 recordServiceImpl.deleteRecordById(id);
			 }
			 response.getWriter().print(1);
		 }catch(Exception e)
		 {
			 response.getWriter().print(0);
		 }
		 
	}
	public Record getModel() {
		// TODO Auto-generated method stub
		return record;
	}

	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
   
}
