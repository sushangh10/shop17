package web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.net.httpserver.HttpsConfigurator;

import domain.Cart;
import domain.CartItem;
import domain.Product;
import service.ProductService;

/**
 * Servlet implementation class AddCartServlet
 */
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		String num = request.getParameter("buyNum");
		
		ProductService service = new ProductService();
		Product product = service.findProductById(pid);
		
		int buyNum=1;
		if(num != null){
			buyNum = Integer.parseInt(num);
			if(buyNum<=0){
				request.setAttribute("msg","plesase input correct num");
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
			}
		}
		double subTotal = buyNum * product.getShop_price();
		CartItem item = new CartItem(product, buyNum, subTotal);
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart == null){
			cart = new Cart();
		}
		
		Map<String, CartItem> cartItems = cart.getCartItems();
		if(cartItems.containsKey(pid)){
			CartItem item2 = cartItems.get(pid);
			int new_num=0;
			new_num=item2.getBuyNum()+buyNum;
			double net_subTotal = item2.getSubTotal()+subTotal;
			cartItems.get(pid).setBuyNum(new_num);
			cartItems.get(pid).setSubTotal(net_subTotal);
		}
		else{
			cart.getCartItems().put(pid, item);
		}
		
		cart.setTotal(cart.getTotal()+subTotal);
		
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
