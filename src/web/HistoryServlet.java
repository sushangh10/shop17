package web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Product;
import service.ProductService;

/**
 * Servlet implementation class HistoryServlet
 */
public class HistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProductService service = new ProductService();
		//显示浏览记录:
				//通过cookie获取
				Cookie[]  cookies = request.getCookies();
				//定义一个接收历史浏览记录的列表
				List<Product> historyList = new ArrayList<>();
				if(cookies != null){
					for (Cookie cookie : cookies) {
						if("pids".equals(cookie.getName())){
							String pids = cookie.getValue();//（2,1,3）
							String[] pids_arr = pids.split(",");
							//对数组循环遍历
							for (String pid : pids_arr) {
								//根据产品编号查找产品
								Product product = service.findProductById(pid);
								//添加到接收历史浏览记录的列表
								historyList.add(product);
							}
						}
					}
				}
				//把历史记录放到域中存起来
				request.setAttribute("historyList",historyList);
				request.getRequestDispatcher("history.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
