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
	//��ȡ��ǰҳ(��ҳ���õ�)
		String currentPage = request.getParameter("currentPage");
		int now_page = 0;
		if(currentPage == null) {
			now_page = 1;
		}else{
			now_page = Integer.parseInt(currentPage);
		}
		
		//����ÿҳ��ʾ��Ʒ������8����Ʒ
		int currentCount = 8;
		
		//1.��ȡ����id
		String cid = request.getParameter("cid");
		//System.out.println(cid);
		//2.����service�㣬���ݷ���id����ȡ��Ʒ
		ProductService service = new ProductService();
		PageBean<Product> pageBean = service.findPorductListCid(cid,now_page,currentCount);
		request.setAttribute("pageBean", pageBean);
		
		//�ѷ���id����request����(��ҳ���õ�)
		request.setAttribute("cid", cid);
		//3.��ת��product_list.jspҳ�棬��ʾ��Ʒ
		
	//��ʾ�����¼:
		//ͨ��cookie��ȡ
		Cookie[]  cookies = request.getCookies();
		//����һ��������ʷ�����¼���б�
		List<Product> historyList = new ArrayList<>();
		if(cookies != null){
			for (Cookie cookie : cookies) {
				if("pids".equals(cookie.getName())){
					String pids = cookie.getValue();//��2,1,3��
					String[] pids_arr = pids.split(",");
					//������ѭ������
					for (String pid : pids_arr) {
						//���ݲ�Ʒ��Ų��Ҳ�Ʒ
						Product product = service.findProductById(pid);
						//��ӵ�������ʷ�����¼���б�
						historyList.add(product);
					}
				}
			}
		}
		//����ʷ��¼�ŵ����д�����
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
