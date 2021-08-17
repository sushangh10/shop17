package web;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.sun.mail.util.DecodingException;

import domain.Cart;
import domain.CartItem;
import domain.Order;
import domain.OrderItem;
import domain.User;
import service.ProductService;

/**
 * Servlet implementation class ProductSubmit
 */
public class ProductSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("user");
		System.out.println("user:"+user);
		if(user == null){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			Order order = new Order();
			order.setOid(UUID.randomUUID().toString());
			order.setOrdertime(new Date());
			Cart cart =(Cart) session.getAttribute("cart");
			order.setTotal(cart.getTotal());
			order.setState(0);
			order.setUser(user);
			
			Map<String,CartItem> list = cart.getCartItems();
			for (Entry<String,CartItem>  entry : list.entrySet()) {
				CartItem cartItem = entry.getValue();
				OrderItem orderItem = new OrderItem();
				orderItem.setItemid(UUID.randomUUID().toString());
				orderItem.setCount(cartItem.getBuyNum());
				orderItem.setSubtotal(cartItem.getSubTotal());
				orderItem.setProduct(cartItem.getProduct());
				orderItem.setOrder(order);
				order.getOrderItems().add(orderItem);	
			}
			
			ProductService service = new ProductService();
			service.submitOrder(order);
			session.setAttribute("order", order);
			response.sendRedirect(request.getContextPath()+"/order_info.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

public void confirmOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session=request.getSession();
	String s= request.getParameter("address");
	System.out.println(s);
	Order order = (Order) session.getAttribute("order");
	try {
		BeanUtils.populate(order, request.getParameterMap());
		System.out.println(order);
		ProductService service = new ProductService();
		service.updateOrderInfo(order);
	} catch (IllegalAccessException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (InvocationTargetException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
