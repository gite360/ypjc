import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


public class gettask extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		String s= "{\"产品编号0\":\"1\",\"产品名称0\":\"橡胶奶嘴\",\"标准编号0\":\"3\",\"样品数量0\":\"3\",\"产品编号1\":\"2\",\"产品名称1\":\"铁锤\",\"标准编号1\":\"2\",\"样品数量1\":\"5\"}";
		String s0= "{ \"样品编号0\":\"W01507100019\",\"样品名称0\":\"PE低发泡片\",\"标准名称0\":\"9687\",\"样品数量0\":\"10\",\"创建日期0\":\"20150517\",\"完成状态0\":\"信息已传入\",\"样品编号1\":\"W01507100020\",\"样品名称1\":\"灶台（远红外辐热炉）标配锅具\",\"标准名称1\":\"9687\",\"样品数量1\":\"10\",\"创建日期1\":\"20150517\",\"完成状态1\":\"信息已传入\",\"样品编号2\":\"W01507100054\",\"样品名称2\":\"聚碳酸酯树脂\",\"标准名称2\":\"13116\",\"样品数量2\":\"10\",\"创建日期2\":\"20150517\",\"完成状态2\":\"项目已分配\",\"样品编号3\":\"W01507110036\",\"样品名称3\":\"PVC托盘\",\"标准名称3\":\"9681\",\"样品数量3\":\"10\",\"创建日期3\":\"20150607\",\"完成状态3\":\"报告未生成\"} ";
		String s2= "{ \"样品编号0\":\"W01507100019\",\"样品名称0\":\"PE低发泡片\",\"标准名称0\":\"9687\",\"样品数量0\":\"10\",\"样品编号1\":\"W01507100020\",\"样品名称1\":\"灶台（远红外辐热炉）标配锅具\",\"标准名称1\":\"9687\",\"样品数量1\":\"10\",\"样品编号2\":\"W01507100054\",\"样品名称2\":\"聚碳酸酯树脂\",\"标准名称2\":\"13116\",\"样品数量2\":\"10\",\"样品编号3\":\"W01507110036\",\"样品名称3\":\"PVC托盘\",\"标准名称3\":\"9681\",\"样品数量3\":\"10\"} ";
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().write(s0);
		System.out.println("gettask()");
		System.out.println(s0);
	}

}
