package web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.PageBean;
import domain.Product;
import service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//获取当前页(分页中用到)
		String currentPage = request.getParameter("currentPage");
		int now_page = 0;
		if(currentPage == null) {
			now_page = 1;
		}else{
			now_page = Integer.parseInt(currentPage);
		}
		
		//定义每页显示商品个数：8个商品
		int currentCount = 8;
		
		//1.获取分类id
		String cid = request.getParameter("cid");
		//System.out.println(cid);
		//2.调用service层，根据分类id来获取商品
		ProductService service = new ProductService();
		PageBean<Product> pageBean = service.findPorductListCid(cid,now_page,currentCount);
		request.setAttribute("pageBean", pageBean);
		
		//把分类id放入request域中(分页中用到)
		request.setAttribute("cid", cid);
		//3.跳转到product_list.jsp页面，显示商品
		
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
		//
		request.getRequestDispatcher("product_list.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
