<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
1. 파라미터 확보
2. 검증(필수데이터 검증, 유효데이터 검증)
3. 불통
	1) 필수데이터 누락 : 400
	2) 우리가 관리하지 않는 멤버를 요구한 경우 : 404
4. 통과
	이동(맵에 있는 개인 페이지, 클라이언트가멤버 개인페이지의 주소를 모르도록)
	이동(맴에 있는 개인 페이지, getBTS에서 원본 요청을 모두 처리했을 경우, UI 페이지로 이동할 때.)
 -->
<%!
	Map<String, String[]> singerMap = new LinkedHashMap<>();

	{
		singerMap.put("0001", new String[]{"RM", "/WEB-INF/bts/rm.jsp"});
		singerMap.put("0002", new String[]{"SUGAR", "/WEB-INF/bts/sugar.jsp"});
		singerMap.put("0003", new String[]{"JIN", "/WEB-INF/bts/jin.jsp"});
		singerMap.put("0004", new String[]{"JUNGKOOK", "/WEB-INF/bts/jungkook.jsp"});
	}
%>

<%
	//인코딩
	request.setCharacterEncoding("UTF-8");

	//파라미터 확보
	String member = request.getParameter("member");
	//System.out.println("member ="+member);
	
	//검증(필수데이터 검증)
	if(member == null || member.trim().length()==0){
		//필수데이터 누락 : 400
		response.sendError(400);
		return;
	}
	
	String singerURL = null;
	if(singerMap.get(member) == null){
		//우리가 관리하지 않는 멤버를 요구한 경우 : 404
		response.sendError(404);
		return;
	}else{
		//이동(맵에 있는 개인 페이지, 클라이언트가멤버 개인페이지의 주소를 모르도록)
		//foward 사용
		singerURL = singerMap.get(member)[1];
		
		//서버가 사용하는 주소(WEBINF아래가 목적지일떄)
 		RequestDispatcher rd = request.getRequestDispatcher(singerURL);
		rd.forward(request, response); 
		
		//클라이언트가 사용하는 주소
		//response.sendRedirect(request.getContextPath()+singerURL);
	}
%>