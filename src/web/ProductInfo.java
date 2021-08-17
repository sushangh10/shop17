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
		
		//1��������ƷID
		String pid =request.getParameter("pid");
		//2������service��ȡ��ƷID
		ProductService service = new ProductService();
		Product product = service.findProductById(pid);
		//3���ѽ�����ؽ���
		request.setAttribute("product", product);
		
		
	//�����¼��
		//����Ʒid����cookie����cookie��pid������������cookieʱҪ�ж��Ƿ�������pid��û�м�һ�����ɣ��еĻ�Ҫƴ��
		
		//����һ����Ʒid��vuale������cookie��Ҳ����˵����������һ��pid��Ҫ�����Ž�ȥ��
		String pids = pid;
		//��ȡ���е�cookie���ȶ���һ��cookie����
		Cookie[] cookies = request.getCookies();
		//�ж�cookie���Ƿ���ֵ����һ�ηž���null
		if(cookies != null){
			//��Ϊnull������
			for (Cookie cookie : cookies) {
				if("pids".equals(cookie.getName())){
					//�����Ǳ��������¼��Ʒ��id 1��2��3

					pids = cookie.getValue();
					//Ҫ�õ�pidֵ�����ݶ��Ŷ�������зָ�
					String[] strs = pids.split(",");
					//������ת�����б�list���в���
					List<String> arrList = Arrays.asList(strs);
					//����ṹ���з������ԣ�����������ļ�¼����ӵ�ͷ��
					LinkedList<String> list = new LinkedList<>(arrList);
					if(list.contains(pid)){
						//��������а���pid���Ƴ����ڵ�pid
						list.remove(pid);
					}
					//�����ز��ظ���Ҫ���½�����pid�������ʼλ�ã���ӵ�����ͷ����
					list.addFirst(pid);
					//��list�����������ַ������Զ��ŷָ���  2��1��3, �浽cookies
					  //StringBuffer�����幦�ܵ��ַ���
					StringBuffer sb = new StringBuffer();
					  //���list����ѭ��
					for(int i=0;i<list.size();i++){
						sb.append(list.get(i));
						sb.append(",");
					}
					//ȥ�����һ������
					sb.substring(0, sb.length()-1);
					pids = sb.toString();
				}
			}
		}
		
		//����cookie����pids��ֵ���ظ��������
		Cookie cookie = new Cookie("pids", pids);
		response.addCookie(cookie);
		
		//��Ҫ�� ����id�͵�ǰҳ ����request����
		request.setAttribute("cid",request.getParameter("cid"));
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		
		
		request.getRequestDispatcher("proinfo.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
