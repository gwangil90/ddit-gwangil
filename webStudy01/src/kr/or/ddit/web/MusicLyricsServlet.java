package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/musicLyrics")
public class MusicLyricsServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");

		ServletContext context =  req.getServletContext();
		String contentFolder = context.getInitParameter("contentFolder");
		File folder = new File(contentFolder);
		String[] filenames = folder.list((File dir, String name) -> {
			String mime = context.getMimeType(name);
		    return mime.startsWith("text/");
		});
		
		// action 속성의 값은 context/imgService, method="get"
		InputStream in = this.getClass().getResourceAsStream("MusicLyrics.html");
		InputStreamReader isr = new InputStreamReader(in, "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		
		StringBuffer html = new StringBuffer();
		String temp = null;
		while((temp = br.readLine()) != null){
			html.append(temp);
		}	
		
		StringBuffer sb = new StringBuffer();
		//String pattern = "<option value='%s'>%s</option>";
		for(int i = 0; i < filenames.length; i++) {
			sb.append("<option value='"+filenames[i]+"'>"+filenames[i]+"</option>");
		}
		
		int start = html.indexOf("@option");	
		int end = start + "@option".length();	
		String replaceText = sb.toString();
		
		html.replace(start,end,replaceText);
		
		PrintWriter out = resp.getWriter();
		out.println(html);
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청 파라미터 확보 : 파라미터명(image)
		// 이미지 스트리밍...
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		
		String param = req.getParameter("musicSel");
        
		if(param == null || param.trim().length() == 0) {
			resp.sendError(400);
			return;
		}
		
		File folder = new File("d:/contents/");
		File lylicFile = new File(folder, param);
		
		System.out.println(lylicFile.getName());
		
		if(!lylicFile.exists()) {
			resp.sendError(404);
			return;
		}
		
		//검증
		//ServletContext context = req.getServletContext();
		//resp.setContentType(context.getMimeType(param));
		
		//txt 파일 ansi type이라 utf-8로 바꿈 
		BufferedReader inFile = new BufferedReader(
									new InputStreamReader(
											new FileInputStream(lylicFile),"UTF-8")); //utf-8 안됨
		StringBuilder sb = new StringBuilder();
		String sLine = null;
		sb.append("<html>");
//		sb.append("<head>");
//		sb.append("<meta charset='UTF-8'>");
//		sb.append("<title>Lylics</title>");
//		sb.append("</head>");
		sb.append("<body>");
		
		String pattern = "<p>%s</p>";
		while((sLine = inFile.readLine()) != null ) {
			sb.append(String.format(pattern, sLine));
		}
		
		sb.append("</body>");
		sb.append("</html>");
		
		PrintWriter out = resp.getWriter();
		out.println(sb.toString());
		out.close();
	}
	
	
}
