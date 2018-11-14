package kr.or.ddit.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value="/imgService")
public class ImageServiceServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 파라미터 확보 : 파라미터명(image)
		// 이미지 스트리밍...
		
		String param = req.getParameter("imageSel");
        
		if(param == null || param.trim().length() == 0) {
			resp.sendError(400);
			return;
		}
		String contentFolder = getServletContext().getInitParameter("contentFolder");
		File folder = new File(contentFolder);
		//File folder = (File)getServletContext().getAttribute("contentFolder");
		File imgFile = new File(folder, param);
		
		if(!imgFile.exists()) {
			resp.sendError(404);
			return;
		}
		
		//검증
		ServletContext context = req.getServletContext();
		resp.setContentType(context.getMimeType(param));
		
		FileInputStream fis = new FileInputStream(imgFile);
		OutputStream out = resp.getOutputStream();
		
		byte[] buffer = new byte[1024];
		
		int pointer = -1;
		while((pointer = fis.read(buffer)) != -1){
			out.write(buffer, 0, pointer);
		}
		
		fis.close();
		out.close();
	}
}
