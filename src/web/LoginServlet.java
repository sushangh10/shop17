package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import domain.User;
import service.RegistService;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String yanzhengma = request.getParameter("yanzhengma");
		String code_session = (String) request.getSession().getAttribute("code_session");
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());
			String autoLogin = request.getParameter("autoLogin");

			if (autoLogin == null) {
				if (code_session.equalsIgnoreCase(yanzhengma)) {
					checkLogin(request, response, user, false);
				} else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.flush();
					out.println("<script>");
					out.println("alert('验证码错误');");
					out.println("history.back();");
					out.println("</script>");
				}
			} else {
				Cookie[] cookies = request.getCookies();
				User u = new User();
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("cookie_username")) {
						u.setUsername(URLDecoder.decode(cookie.getValue(), "UTF-8"));
					} else if (cookie.getName().equals("cookie_password")) {
						u.setPassword(URLDecoder.decode(cookie.getValue(), "UTF-8"));
					}
				}
				checkLogin(request, response, u, true);
			}

		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	private void checkLogin(HttpServletRequest request, HttpServletResponse response, User user, boolean isAutoLogin)
			throws IOException {

		RegistService service = new RegistService();
		User u = service.login(user, isAutoLogin);
		
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			Cookie cookie_username = new Cookie("cookie_username", URLEncoder.encode(user.getUsername(), "UTF-8"));
			Cookie cookie_password = new Cookie("cookie_password", URLEncoder.encode(user.getPassword(), "UTF-8"));
			response.addCookie(cookie_username);
			response.addCookie(cookie_password);
			response.sendRedirect("index");
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('用户名，密码错误 或 用户未激活！');");
			out.println("history.back();");
			out.println("</script>");
			//response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
