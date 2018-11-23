<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = request.getParameter("url");
	File folder = new File(url);
	File[] files = folder.listFiles();
	StringBuffer str = new StringBuffer();
	
		for ( int i = 0; i < files.length; i++ ) {
	    	if ( !files[i].isFile()){
	    		str.append(String.format("<div class='file folder' value='%s'>%s</div>", files[i].getParent()+"/"+files[i].getName(), files[i].getName()));
	   		}else{
	   			str.append(String.format("<div class='file' value='%s'>%s</div>", files[i].getParent()+"/"+files[i].getName(), files[i].getName()));
	   		}
		}
		out.println(str.toString());
%>