package ypjc.filter;

import java.io.IOException;  

import javax.faces.convert.Converter;
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

import com.sun.faces.facelets.tag.jsf.core.ConvertDateTimeHandler;

public class LoginFilter implements Filter {  
    @Override
	public void destroy() {
    }  
    @Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {  
    	HttpSession session = ((HttpServletRequest) request).getSession();
    	String username;
    	//TODO
    	//userName = session.getAttribute("username").toString();
    	String url = ((HttpServletRequest) request).getRequestURI();
    	String subUrl = url.substring(url.lastIndexOf('/'));
    	String redirectUrl = url.substring(0, url.lastIndexOf('/')) + "/login.jsp";
    	
    	if ("/login.jsp".equals(subUrl)){
    		chain.doFilter(request, response);
    	} else if (session.getAttribute("username") != null){
    		int permission = (Integer)session.getAttribute("permission");
        	// 项目分配权限
        	int permission1 = permission % 10;
        	// 样品分配权限
        	int permission2 = permission % 100 / 10;
        	// 生成原始记录权限
        	int permission3 = permission % 1000 / 100;
        	// 修改个人信息权限
        	int permission4 = permission % 10000 / 1000;
        	if((permission1 == 1) && ("/showAllSpecimen0.jsp".equals(subUrl) || "/selectItems0.jsp".equals(subUrl)|| "/addPart0.jsp".equals(subUrl))){
    			chain.doFilter(request, response);
        	}else if((permission2 == 1) && ("/yangpinfenpei.jsp".equals(subUrl) || "/selectedItems1.jsp".equals(subUrl) 
        			|| "/setSpecificWeightInfo1.jsp".equals(subUrl) || "/qiminbianhao.jsp".equals(subUrl))){
        		chain.doFilter(request, response);
        	}else if((permission3 == 1) && ("/shengchengyuanshijilu.jsp".equals(subUrl) || "/jiancexiangmu3.jsp".equals(subUrl)
        			|| "/zfczysjl1.jsp".equals(subUrl))){
        		chain.doFilter(request, response);
			}else if((permission4 == 1) && ("/setinfo.jsp".equals(subUrl))){
				chain.doFilter(request, response);
			}else{
    			((HttpServletResponse)response).sendRedirect(redirectUrl);
			}
		}
    	else if (session.getAttribute("username") == null) {
    		((HttpServletResponse)response).sendRedirect(redirectUrl);
    	}
	}
    @Override
	public void init(FilterConfig filterConfig) throws ServletException {
    }  
}  