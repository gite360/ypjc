

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getSpecimenPart
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/getSpecimenPart" })
public class getSpecimenPart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSpecimenPart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("getSpecimenPart");
		
		String s0= "{ \"样品编号0\":\"W01507100019\",\"样品名称0\":\"PE低发泡片\",\"部件名称0\":\"盖子\",\"部件数量0\":\"10\",\"标准编号0\":\"9687\",\"status0\":\"项目已分配\",\"样品编号1\":\"W01507100019\",\"样品名称1\":\"PE低发泡片\",\"部件名称1\":\"杯身\",\"部件数量1\":\"10\",\"标准编号1\":\"9687\",\"完成状态1\":\"项目未分配\"} ";
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
//		response.getWriter().write(jsonObject.toString());
		response.getWriter().write(s0);
		/*response.getWriter().flush();*/
		/*System.out.println(jsonObject.toString());*/
		System.out.println(s0);
	}

}
