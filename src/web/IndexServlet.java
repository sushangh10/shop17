package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.Category;
import domain.Product;
import service.ProductService;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
		//1.����service��ȡ������Ʒ��������Ʒ
		List<Product> hot_products = service.getHotProducts();
		List<Product> new_products = service.getNewProducts();
		List<Product> cx_products = service.getCxProducts();
		
		//����service��ȡ������Ʒ��
		List<Product> first_products = service.getFirstProducts();
		List<Product> second_products = service.getSecondProducts();
		List<Product> third_products = service.getThirdProducts();
				
		//2.��2����Ʒrequest����
		request.setAttribute("hot_products", hot_products);
		request.setAttribute("new_products", new_products);
		request.setAttribute("cx_products", cx_products);
		
		//��ȡ������Ʒ
		request.setAttribute("first_products", first_products);
		request.setAttribute("second_products", second_products);
		request.setAttribute("third_products", third_products);
		//�ѷ�����Ϣ����session���У�һ���û���������ҳ�涼���Ի�ȡ������Ϣ
		//��ȡ��Ʒ�ķ�����Ϣ
				List<Category> categories = service.getCategories();
		request.getSession().setAttribute("categories", categories);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
