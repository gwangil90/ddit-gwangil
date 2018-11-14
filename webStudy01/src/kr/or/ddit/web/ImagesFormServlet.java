package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImagesFormServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		ServletContext context =  req.getServletContext();
		String contentFolder = context.getInitParameter("contentFolder");
		File folder = new File(contentFolder);
//		File folder = (File)context.getAttribute("contentFolder");
		
		String[] filenames = folder.list((File dir, String name) -> {
			String mime = context.getMimeType(name);
		    return mime.startsWith("image/");
		});
		
		// action 속성의 값은 context/imgService, method="get"
		InputStream in = this.getClass().getResourceAsStream("imageView.html");
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
}
