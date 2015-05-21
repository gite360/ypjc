

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class setpart
 */
@WebServlet("/setpart")
public class setpart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public setpart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSS");*/
		//response.setContentType("text/html");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("标准id0", "1");
		jsonObject.put("检验内容1", "李磊");
		jsonObject.put("标准id1", "2");
		jsonObject.put("检验内容2", "好的");
		/*return jsonObject.toString();*/
		String s= "{\"status\":\"success\"}";
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().write(jsonObject.toString());
		response.getWriter().write(s);
		/*response.getWriter().flush();*/
		/*System.out.println(jsonObject.toString());*/
		/*System.out.println(s);*/
	}

}
