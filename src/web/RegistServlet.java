package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import domain.User;
import service.RegistService;
import utils.MailUtils;

/**
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			ConvertUtils.register(new Converter() {
				public Object convert(Class arg0, Object arg1) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date desc = null;
					try {
						desc = sdf.parse((String) arg1);
					} catch (ParseException e) {
						e.printStackTrace();
					}
					return desc;
				}
			}, Date.class);

			String yanzhengma = request.getParameter("yanzhengma");
			String code_session = (String) request.getSession().getAttribute("code_session");

			if (code_session.equalsIgnoreCase(yanzhengma)) {
				User user = new User();
				BeanUtils.populate(user, request.getParameterMap());
				
				user.setUid(UUID.randomUUID().toString());
				user.setState(0);
				user.setCode(UUID.randomUUID().toString());
				System.out.println(user);
				RegistService service = new RegistService();
				boolean flag = service.regist(user);

				if (flag) {
					String emailMsg = "恭喜您注册成功，请点击下面的链接进行激活账户"
							+ "<a href='http://localhost:8080/ShopDemo/active?code='" + user.getCode() + ">"
							+ "http://localhost:8080/ShopDemo/active?code=" + user.getCode() + "</a>";
					System.out.println(user.getEmail());
					MailUtils.sendMail(user.getEmail(), emailMsg);
					response.sendRedirect("registerSuccess.jsp");
				} else {
					/*response.sendRedirect("reg.jsp");*/
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.flush();
					out.println("<script>");
					out.println("alert('注册失败！');");
					out.println("history.back();");
					out.println("</script>");
					
				}

			} else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.flush();
				out.println("<script>");
				out.println("alert('验证码错误');");
				out.println("history.back();");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
