package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/song")
public class MusicLylicServlet2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String song = req.getParameter("song");
		
		int status = 0;
		String msg = null;
		
		if(song == null || song.trim().length() == 0) {
			status = HttpServletResponse.SC_BAD_REQUEST;
			msg = "가사파일을 선택해 주세요.";
		}
		String contentFolder = getServletContext().getInitParameter("contentFolder");
		File folder = new File(contentFolder);
		File songFile = new File(folder, song);
		
		if(!songFile.exists()) {
			status = HttpServletResponse.SC_NOT_FOUND;
			msg = "해당 곡은 가사가 없습니다.";
		}
		
		if(status != 0) {
			resp.sendError(status, msg);
			return;
		}
		
		resp.setContentType("text/html;charset=UTF-8");
		FileInputStream fis = new FileInputStream(songFile);
		InputStreamReader isr = new InputStreamReader(fis, "MS949");
		BufferedReader reader = new BufferedReader(isr);
		
		String temp = null;
		StringBuffer html = new StringBuffer();
		while((temp = reader.readLine())!= null) {
			html.append("<p>"+temp+"</p>");
			System.out.println(temp);
		}
		
		PrintWriter out = resp.getWriter();
		out.println(html);
		
		reader.close();
		out.close();
	}
}
