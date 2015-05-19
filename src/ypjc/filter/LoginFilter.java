package ypjc.filter;

import java.io.IOException;  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
/** 
 * ��½filter
 *  
 *  
 */  
public class LoginFilter implements Filter {  
    public void destroy() {
    }  
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {  
    	HttpSession session = ((HttpServletRequest) request).getSession();
    	String username;
    	//TODO ��ȡsession����Ϣ
    	//userName = session.getAttribute("username").toString();
    	String url = ((HttpServletRequest) request).getRequestURI();
    	String subUrl = url.substring(url.lastIndexOf('/'));
    	String redirectUrl = url.substring(0, url.lastIndexOf('/')) + "/login.jsp";
    	//����ǵ�¼�ͷ���
    	if ("/login.jsp".equals(subUrl)){
    		// ����
    		chain.doFilter(request, response);
    		//�ǵ�½������δ��½
    	} else if (session.getAttribute("username") != null && session.getAttribute("permission").equals(1)){
    		if("/xiangmufenpei.jsp".equals(subUrl) || "/jiancexiangmu.jsp".equals(subUrl))
    			chain.doFilter(request, response);
    		else {
    			((HttpServletResponse)response).sendRedirect(redirectUrl);
			}
    	} else if (session.getAttribute("username") != null && session.getAttribute("permission").equals(2)) {
    		if("/yangpinfenpei.jsp".equals(subUrl) || "/selectedItems1.jsp".equals(subUrl) || "/setSpecificWeightInfo1.jsp".equals(subUrl))
    			chain.doFilter(request, response);
    		else {
    			((HttpServletResponse)response).sendRedirect(redirectUrl);
			}
		} else if (session.getAttribute("username") != null && session.getAttribute("permission").equals(3)) {
    		if("/shengchengyuanshijilu.jsp".equals(subUrl) || "/jiancexiangmu3.jsp".equals(subUrl) || "/zfczysjl1.jsp".equals(subUrl))
    			chain.doFilter(request, response);
    		else {
    			((HttpServletResponse)response).sendRedirect(redirectUrl);
			}
		} 
    	else if (session.getAttribute("username") == null) {
    		// �ض��򵽵�¼���棬����ʾû��Ȩ��  
    		((HttpServletResponse)response).sendRedirect(redirectUrl);
    	}
	}
    public void init(FilterConfig filterConfig) throws ServletException {
    }  
}  