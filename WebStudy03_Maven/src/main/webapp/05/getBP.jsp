<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 파라미터 확보 (select태그의 네임값=member) -->
<!-- 2. 검증(필수데이터 검증, 유효데이터 검증) -->
<!-- 3. 불통 -->
<!-- 	1) 필수데이터 누락 : 400 -->
<!-- 	2) 우리가 관리하지 않는 멤버를 요구한 경우 : 404 -->
<!-- 4. 통과	    -->
<!--        이동(맵에 있는 개인 페이지, 클라이언트가 멤버 개인페이지의 주소를 모르도록.dispatch)	 -->
<!--        이동(맵에 있는 개인 페이지, getBP에서 원본 요청을 모두 처리했을 경우, UI 페이지로 이동할 때, Redirect)	 -->

<!-- jsp의 문제점 : 다른 jsp로부터 객체를 불러올 수 없다, was에서 컴파일을 시켜주는 터라 public로 접근허용처리를 해줘도 무용지물 -->

<%!
	Map<String, String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001",new String[]{"제니","/WEB-INF/blackpink/jennie.jsp"});
	singerMap.put("B002",new String[]{"지수","/WEB-INF/blackpink/jisoo.jsp"});
	singerMap.put("B003",new String[]{"리사","/WEB-INF/blackpink/lisa.jsp"});
	singerMap.put("B004",new String[]{"로제","/WEB-INF/blackpink/rose.jsp"});
}
%>

<%
	int statusCode = 0;
	String memStr = request.getParameter("member");
	if(memStr == null || memStr.trim().length()==0){ //필수데이터의 누락
		statusCode = HttpServletResponse.SC_BAD_REQUEST; //400
	}else if(!singerMap.containsKey(memStr)){ //키가 존재하지 않는 경우 
		statusCode = HttpServletResponse.SC_NOT_FOUND; //404
	}
	if(statusCode!=0){
		response.sendError(statusCode);
		return;
	}
	
	String[] value = singerMap.get(memStr);
	String goPage = value[1];
	
// 	response.sendRedirect(request.getContextPath()+goPage); //클라이언트사이드 경로표기
	
	//처리가 끝나는 그 순간 member라는 파라미터는 소멸되고 없다.
	
	RequestDispatcher rd = request.getRequestDispatcher(goPage); //서버사이드 경로표기		
	rd.forward(request, response);

	/* for(String key : singerMap.keySet()){
		if(key.equals(memStr)){			
			goPage = singerMap.get(key)[1];
		}
	} */
	
%>