package com.sunset.admin.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.sunset.core.service.DepartmentService;
import com.sunset.core.service.UserService;
import com.sunset.core.web.SuperAction;
import com.sunset.model.Department;
import com.sunset.model.Page;
import com.sunset.model.User;
import com.sunset.util.SystemUtil;
public class AdminUserAction extends SuperAction implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user = new User();
	
	@Autowired
	private UserService userServiceImpl;
	@Autowired
	private DepartmentService departmentServiceImpl;
	
	public void setDepartmentServiceImpl(DepartmentService departmentServiceImpl) {
		this.departmentServiceImpl = departmentServiceImpl;
	}
	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}
	 
	 
	 public String manage()
	 {
		 
		 return "manage";
	 }
	 
	  public String list() throws IOException
		{
			 
		    if(user.getDepartmentId() ==null){
		    String departmentId = request.getParameter("departmentId");
		    user.setDepartmentId(departmentId);
		    }
		    Department d= departmentServiceImpl.queryDepartmentById(user.getDepartmentId());
			Page page =  new Page();
			 String pageIndex = request.getParameter("currentPage");
			 int currentPage = 1;
			 if(!SystemUtil.isEmpty(pageIndex))
			 {
				 currentPage = Integer.parseInt(pageIndex);
			 }
			 page.setCurrentPage(currentPage);
			
			userServiceImpl.queryUserList(user, page);
			request.setAttribute("page",page);
			request.setAttribute("department",d.getName());
			request.setAttribute("user",user);
			return "list";
		}
	  
	  public String add() throws IOException  
		 {
			 
			 user.setDepartmentId(request.getParameter("departmentId"));
			 user.setName(request.getParameter("name"));
			 user.setAccount(request.getParameter("account"));
			 user.setRank(request.getParameter("rank"));
			 user.setTelephone(request.getParameter("telephone"));
			 user.setSex(request.getParameter("sex"));
			 User u = userServiceImpl.queryUserByAccount(user.getAccount());
			 if(u != null)
			 {
				 response.getWriter().print(2);
				 return null;
			 }
			 try{
				 userServiceImpl.addUser(user);
				 response.getWriter().print(1);
				 }catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	  
	  public String update() throws IOException  
		 {
		     String userId = request.getParameter("userId");
		     User u = userServiceImpl.queryUser(userId);
		     u.setName(request.getParameter("name"));
		     u.setSex(request.getParameter("sex"));
			 u.setRank(request.getParameter("rank"));
			 u.setTelephone(request.getParameter("telephone"));
			 try{
				 userServiceImpl.updateUser(u);
				 response.getWriter().print(1);
				 }catch(Exception e)
				 {
					 e.printStackTrace();
					 response.getWriter().print(0);
				 }
			 return null;
		 }
	  public void changeStatus() throws IOException
		 {
			
			 try{
				 String userId = request.getParameter("userId");
				 User u = userServiceImpl.queryUser(userId);
				 u.setStatus(request.getParameter("status"));
				 userServiceImpl.updateUser(u);
			}catch(Exception e)
			{
					 e.printStackTrace();
					 response.getWriter().print(0);
			}
		 }
	  
	  public void modifyPassword() throws IOException
		 {
			
			 try{
				 User u = (User) session.getAttribute("user");
				 String newPassword = request.getParameter("newPassword");
				 String oldPassword = request.getParameter("oldPassword");
				 if(!oldPassword.equals(u.getPassword()))
				 {
					 response.getWriter().print(1);
					 return ;
				 }
				 u.setPassword(newPassword);
				 userServiceImpl.updateUser(u);
				 response.getWriter().print(0);
			}catch(Exception e)
			{
					 e.printStackTrace();
					 response.getWriter().print(2);
			}
		 }
	  public String edit() throws IOException
		 {
			
				 User u = userServiceImpl.queryUser(user.getUserId());
				 request.setAttribute("user",u);
				 
				 return "edit";
			 
		 }
	  
	  public String modifyPower() throws IOException
		 {
		          String userId = request.getParameter("userId");
		          char[] powerValues = request.getParameter("powerValue").toCharArray();
		          String[] powerFlgs = request.getParameter("powerFlg").split(",");
				  User u = userServiceImpl.queryUser(userId);
				  StringBuffer power = new StringBuffer(u.getPower());
				  for(int i =0;i<powerFlgs.length;i++){
					  power.setCharAt(Integer.parseInt(powerFlgs[i])-1, powerValues[i]);
				  }
				  u.setPower(power.toString());
				  userServiceImpl.updateUser(u);
				 response.getWriter().print(1);
				 return null;
			 
		 }
	  public void delete() throws IOException
		 {
		     String userId = request.getParameter("userId");
			 userServiceImpl.deleteUserById(userId);
			 response.getWriter().print(1);
		 }
	  
	  
	  
	  public String logout() throws IOException
		{
			 session.invalidate();
			 request.setAttribute("css", "tip_blue");
		     request.setAttribute("message", "退出成功!");
			return "login_view";
		}
		public String login() throws IOException
		{
			
			User active = userServiceImpl.queryUserByAccount(user.getAccount());
			if(active == null || !active.getPassword().equals(user.getPassword()))
			{
				request.setAttribute("css", "tip_red");
				request.setAttribute("message", "账号或者密码错误!");
				return "login_failed";
			}
			if(!active.getStatus().equals("0")){
				request.setAttribute("css", "tip_red");
				request.setAttribute("message", "该账号已经被停用");
				return "login_failed";
			}
			else
			{
				  session.setAttribute("user",active);
				  Object targetPath =  session.getAttribute("targetPath");
				  if(targetPath!=null)
				  {
					  response.sendRedirect(targetPath.toString());
					  return null;
				  }

			}
			return "login_success";
		}
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



	public User getUser() {
		return user;
	}
    
}
