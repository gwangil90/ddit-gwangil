package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MusicLyricsServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context= req.getServletContext();
		
		File folder= new File("d:/contents");
		String[] filenames=folder.list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				String mime =context.getMimeType(name);
				if(mime!=null) {
					
					return mime.startsWith("text/");
				}
				return false;
			}
		});
		StringBuffer sb= new StringBuffer();
		resp.setContentType("text/html;charset=UTF-8");
		
		InputStream in= this.getClass().getResourceAsStream("musicLyricsForm.html");
		InputStreamReader isr= new InputStreamReader(in,"UTF-8");
		BufferedReader br = new BufferedReader(isr);
		StringBuffer html= new StringBuffer();
		String temp=null;
		while((temp=br.readLine())!=null){ //줄 기준으로 읽어들이기
			html.append(temp+"\n"); //줄 기준으로 읽어들이고 띄워주기
		}
		String pattern="<option>%s</option>\n";
		for (int i = 0; i < filenames.length; i++) {
			sb.append(String.format(pattern, filenames[i]));
		}
		int start= html.indexOf("@options");
		int end =start + "@options".length();
		html.replace(start,end,sb.toString());
		
		PrintWriter out=resp.getWriter();
		out.println(html.toString());
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name=req.getParameter("list");
		if(name==null ||name.trim().length()==0) {
			resp.sendError(400);
			return;
		}
		File txt=new File("d:/contents/"+name);
		if(!txt.exists()) {
			resp.sendError(404);
			return;
		}
		
		InputStream in= this.getClass().getResourceAsStream("musicLyricsText.html");
		InputStreamReader isr= new InputStreamReader(in,"UTF-8");
		BufferedReader br = new BufferedReader(isr);
		StringBuffer htmltext= new StringBuffer();
		String temptext=null;
		while((temptext=br.readLine())!=null){
			htmltext.append(temptext+"\n");
		}
		
		ServletContext context = req.getServletContext();
	
		FileReader fileReader= new FileReader(txt);
		BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(txt), "euc-kr"));
		resp.setContentType(context.getMimeType(name));
		StringBuffer html= new StringBuffer();
		String temp=null;
		while((temp=reader.readLine())!=null){
			html.append(temp+"<br>");
		}
		reader.close();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		int start= htmltext.indexOf("@text");
		int end =start + "@text".length();
		htmltext.replace(start,end,html.toString());
		PrintWriter out=resp.getWriter();
		out.println(htmltext.toString());
		out.close();
	}
}
