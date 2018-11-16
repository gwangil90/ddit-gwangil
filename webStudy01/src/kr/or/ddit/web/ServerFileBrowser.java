package kr.or.ddit.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileBrowser.do")
public class ServerFileBrowser extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String url = req.getParameter("url");
		String fileList = getServletContext().getInitParameter("fileList");
		String[] json = null;
		
		File folder = null;
		File[] files = null;
		
		if(url == null) {
			folder = new File(fileList);
			files = folder.listFiles();
		}else {
			folder = new File(url);
			files = folder.listFiles();
			req.setAttribute("url2", url);
		}
		
		req.setAttribute("file", files);
		
		String view = "/WEB-INF/views/fileBrowser.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		rd.forward(req, resp);
	}
	
}
