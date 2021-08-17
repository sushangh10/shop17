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
