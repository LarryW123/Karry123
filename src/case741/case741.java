package case741;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class case741 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
	    //String str = "{\"学校\":\"九江学院\",\"地址\":\"江西省九江市前进东路551号\",\"班级\":[{\"班级名称\":\"信A1011\",\"专业名称\":\"计算机科学与技术\",\"所在学院\":\"信息科学与技术学院\",\"入学年份\":2010,\"班级人数\":36},{\"班级名称\":\"信A1121\",\"专业名称\":\"软件工程\",\"所在学院\":\"信息科学与技术学院\",\"入学年份\":2011,\"班级人数\":39},{\"班级名称\":\"会A1012\",\"专业名称\":\"审计学\",\"所在学院\":\"会计学院\",\"入学年份\":2010,\"班级人数\":42},{\"班级名称\":\"旅A1211\",\"专业名称\":\"酒店管理\",\"所在学院\":\"旅游与国土资源学院\",\"入学年份\":2012,\"班级人数\":31}]}";
	    String str = "{'学校':'九江学院','地址':'江西省九江市前进东路551号','班级':[{'班级名称':'信A1011','专业名称':'计算机科学与技术','所在学院':'信息科学与技术学院','入学年份':2010,'班级人数':36},{'班级名称':'信A1121','专业名称':'软件工程','所在学院':'信息科学与技术学院','入学年份':2011,'班级人数':39},{'班级名称':'会A1012','专业名称':'审计学','所在学院':'会计学院','入学年份':2010,'班级人数':42},{'班级名称':'旅A1211','专业名称':'酒店管理','所在学院':'旅游与国土资源学院','入学年份':2012,'班级人数':31}]}";
	    out.print(str);
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

}
