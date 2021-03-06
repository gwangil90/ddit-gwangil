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
public class MusicLyricsServlet2 extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String song = req.getParameter("song");
		String message = null;
		int status = 0;
		if(song == null || song.trim().length()==0) {
			status = HttpServletResponse.SC_BAD_REQUEST;
			message = "가사파일을 선택해주세요.";
		}
		File folder = (File)getServletContext().getAttribute("contentFolder");
		File songFile = new File(folder, song);
		
		if(!songFile.exists()) {
			status = HttpServletResponse.SC_NOT_FOUND;
			message = "해당 곡은 가사가 없습니다.";
		}
		if(status!=0) {
			resp.sendError(status, message);
			return;
		}
		resp.setContentType("text/html;charset=UTF-8");
		try( //try with resourse 구문: 1.7버전 이상에서만 사용 가능한 문법 
				//Closable 객체를 할당
				FileInputStream fis = new FileInputStream(songFile);
				InputStreamReader isr = new InputStreamReader(fis, "euc-kr");
				BufferedReader reader = new BufferedReader(isr);
				PrintWriter out = resp.getWriter();
				) {
		String temp = null;
		StringBuffer html = new StringBuffer();
		while((temp = reader.readLine())!=null) {
			html.append("<p>"+temp+"</p>");
			System.out.println(temp);
		}
		out.println(html);
		}
	}
}
