package ypjc.structs.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class LoginAction {
	private String username;
	private String password;   
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
	public String execute() {
		//TODO ����ݿ��ѯ�����Լ�Ȩ��
		String databasePassword = "";
		int permission = 1;
		if(this.getUsername().equals("1")){
			permission = 1;
		}
		if(this.getUsername().equals("2")){
			permission = 2;
		}
		if(this.getUsername().equals("3")){
			permission = 3;
		}
		HttpSession session = ServletActionContext. getRequest().getSession();
		//������Ŀ����Ȩ��
	    if(this.getPassword().equals(databasePassword) && permission == 1){
			session.setAttribute("username",this.getUsername());
			session.setAttribute("permission",permission);
	        return "success1";
	    }
	    //��Ʒ����Ȩ��
	    else if(this.getPassword().equals(databasePassword) && permission == 2){
	    	session.setAttribute("username",this.getUsername());
			session.setAttribute("permission",permission);
	    	return "success2";
	    }
	    //���ԭʼ��¼Ȩ��
	    else if(this.getPassword().equals(databasePassword) && permission == 3){
	    	session.setAttribute("username",this.getUsername());
			session.setAttribute("permission",permission);
	    	return "success3";
	    //��½ʧ��
	    }else{
	        return "fail";
	    }
	}
}
