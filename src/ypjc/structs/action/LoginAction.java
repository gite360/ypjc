package ypjc.structs.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class LoginAction {
	private String username;
	private String password;
	private int flag;
    public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String execute() {
		// TODO
		String databasePassword = "";
		int permission = 1111;
		// 项目分配权限
		int permission1 = permission % 10;
		// 样品分配权限
		int permission2 = permission % 100 / 10;
		// 生成原始记录权限
		int permission3 = permission % 1000 / 100;
		// 修改个人信息权限
		int permission4 = permission % 10000 / 1000;
		HttpSession session = ServletActionContext.getRequest().getSession();
	    if(this.getPassword().equals(databasePassword)){
			session.setAttribute("username",this.getUsername());
			session.setAttribute("permission",permission);
			if (permission1 == 1){
				session.setAttribute("permission1","true");
			}
			if(permission2 == 1){
				session.setAttribute("permission2","true");
			}
			if(permission3 == 1){
				session.setAttribute("permission3","true");
			}
			if(permission4 == 1){
				session.setAttribute("permission4","true");
			}
			if (permission1 == 1){
				return "success1";
			}
			if(permission2 == 1){
				return "success2";
			}
			if(permission3 == 1){
				return "success3";
			}
			if(permission4 == 1){
				return "success4";
			}
			this.setFlag(1);
			return "fail";
	    }else{
	    	this.setFlag(1);
	        return "fail";
	    }
	}
}
