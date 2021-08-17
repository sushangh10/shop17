package web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Cart;
import domain.CartItem;

/**
 * Servlet implementation class Decrease
 */
public class Decrease extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session =request.getSession();
		
		String pid = request.getParameter("pid");
		
		Cart cart = (Cart) session.getAttribute("cart");
		//CartItem cItem = (CartItem) session.getAttribute("cartItem");
		if (cart!=null) {
			Map<String, CartItem> list = cart.getCartItems();
			
			//cItem.setSubTotal(cItem.getSubTotal()+list.get(pid).getProduct().getShop_price());
			//CartItem citem = (CartItem) cart.getCartItems();
		//	citem.setSubTotal(citem.getSubTotal()+list.get(pid).getProduct().getShop_price());
			list.get(pid).setSubTotal(list.get(pid).getSubTotal()-list.get(pid).getProduct().getShop_price());
			list.get(pid).setBuyNum(list.get(pid).getBuyNum()-1);
			cart.setTotal(cart.getTotal()-list.get(pid).getProduct().getShop_price());
		}
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
