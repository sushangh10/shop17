package web;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductService;
import domain.Product;

/**
 * Servlet implementation class ProductInfo
 */
public class ProductInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1、接收商品ID
		String pid =request.getParameter("pid");
		//2、调用service获取商品ID
		ProductService service = new ProductService();
		Product product = service.findProductById(pid);
		//3、把结果返回界面
		request.setAttribute("product", product);
		
		
	//浏览记录：
		//把商品id放入cookie。把cookie的pid连接起来，放cookie时要判断是否有其他pid，没有加一个即可，有的话要拼接
		
		//定义一个商品id的vuale，放入cookie（也就是说，我现在有一个pid，要把它放进去）
		String pids = pid;
		//获取所有的cookie。先定义一个cookie数组
		Cookie[] cookies = request.getCookies();
		//判断cookie里是否有值，第一次放就是null
		if(cookies != null){
			//不为null，遍历
			for (Cookie cookie : cookies) {
				if("pids".equals(cookie.getName())){
					//这里是保存浏览记录商品的id 1，2，3

					pids = cookie.getValue();
					//要拿到pid值，根据逗号对数组进行分割
					String[] strs = pids.split(",");
					//把数组转换成列表list进行操作
					List<String> arrList = Arrays.asList(strs);
					//链表结构，有方法可以（将最新浏览的记录）添加到头部
					LinkedList<String> list = new LinkedList<>(arrList);
					if(list.contains(pid)){
						//如果链表中包含pid，移除存在的pid
						list.remove(pid);
					}
					//无论重不重复都要将新进来的pid添加在起始位置（添加到链表头部）
					list.addFirst(pid);
					//把list中数据做成字符串，以逗号分隔成  2，1，3, 存到cookies
					  //StringBuffer带缓冲功能的字符串
					StringBuffer sb = new StringBuffer();
					  //针对list进行循环
					for(int i=0;i<list.size();i++){
						sb.append(list.get(i));
						sb.append(",");
					}
					//去除最后一个逗号
					sb.substring(0, sb.length()-1);
					pids = sb.toString();
				}
			}
		}
		
		//创建cookie，把pids的值返回给浏览器端
		Cookie cookie = new Cookie("pids", pids);
		response.addCookie(cookie);
		
		//需要把 分类id和当前页 放入request域中
		request.setAttribute("cid",request.getParameter("cid"));
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		
		
		request.getRequestDispatcher("proinfo.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
