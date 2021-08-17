package web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import domain.Category;
import service.AdminCategoryService;
import service.AdminCategoryUpdateService;

/**
 * Servlet implementation class AdminCategoryUpdateServlet
 */
public class AdminCategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String cid = request.getParameter("cid");
//	categories=request.getSession().getAttribute("categories");
		String cname = request.getParameter("cname");
		
		System.out.println(cname);
		//System.out.println(cid);
		request.setCharacterEncoding("utf-8");
		
		AdminCategoryUpdateService acus = new AdminCategoryUpdateService();
		Category category = new Category();
		response.sendRedirect("super.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
