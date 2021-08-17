package web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//  鍒涘缓鐢诲竷
		int width = 120;
		int height = 40;
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//  鑾峰緱鐢荤瑪
		Graphics g = bufferedImage.getGraphics();
		//  濉厖鑳屾櫙棰滆壊
		g.setColor(Color.white);
		g.fillRect(0, 0, width, height);
		//  缁樺埗杈规
		g.setColor(Color.red);
		g.drawRect(0, 0, width - 1, height - 1);
		//  鐢熸垚闅忔満瀛楃
		//  鍑嗗鏁版嵁
		String data = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		//  鍑嗗闅忔満瀵硅薄
		Random r = new Random();
		//  澹版槑涓�釜鍙橀噺 淇濆瓨楠岃瘉鐮�
		String code = "";
		//  涔﹀啓4涓殢鏈哄瓧绗�
		for (int i = 0; i < 4; i++) {
			//  璁剧疆瀛椾綋
			g.setFont(new Font("瀹嬩綋", Font.BOLD, 28));
			//  璁剧疆闅忔満棰滆壊
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));

			String str = data.charAt(r.nextInt(data.length())) + "";
			g.drawString(str, 10 + i * 28, 30);

			//  灏嗘柊鐨勫瓧绗�淇濆瓨鍒伴獙璇佺爜涓�
			code = code + str;
		}
		//  缁樺埗骞叉壈绾�
		for (int i = 0; i < 6; i++) {
			//  璁剧疆闅忔満棰滆壊
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));

			g.drawLine(r.nextInt(width), r.nextInt(height), r.nextInt(width), r.nextInt(height));
		}

		//  灏嗛獙璇佺爜 鎵撳嵃鍒版帶鍒跺彴
		System.out.println(code);

		//  灏嗛獙璇佺爜鏀惧埌session涓�
		request.getSession().setAttribute("code_session", code);

		//  灏嗙敾甯冩樉绀哄湪娴忚鍣ㄤ腑
		ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}