<%@page import="kr.or.ddit.vo.AlbasengVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/includeDesc.jsp</title>
</head>
<body>
<h4>Include</h4>
<pre>
	-어느 시점에 include되고 무엇을 가져오느냐?에 따라 동적, 정적으로 나뉜다.
	1. 동적 include(dynamic) : 실행 중(runtime), 실행 결과물들이 include
							서버사이드 페이지 모듈화에 주로 사용됨. 모듈화란? 전체구조를 여러구조로 쪼개버리는거래.
							1) RequestDispatcher를 사용
							2) PageContext를 사용
							3) 액션 태그를 사용
							JSP 스펙에 따라 기본적으로 제공되는 커스텀 태그.
							&lt;prefix:tagname attribute..../&gt;
							- forward : request dispatch 방식의 forward
							- include : request dispatch 방식의 include
							- useBean
								(setPropety/getPropety)
								<!-- 스크립기호 없이도 VO를 선언할 수 있다. -->
								<!-- 게다가 scope로 데이터를 공유해줄 수도 있다. 스코프에서 아이디를 뒤져서 해당 아이디가 있으면 그 영역에 변수를 만들어준다라네? 개신기-->
								<jsp:useBean id="albaVO" class="kr.or.ddit.vo.AlbasengVO" scope="page"/> 

								<jsp:setProperty property="name" name="albaVO" value="이름"/>
								<jsp:getProperty property="name" name="albaVO"/>

								<jsp:setProperty property="age" name="albaVO" param="age"/> <!-- age 파라미터를 잡아서 바로 그 값을 넣어준다 -->
								<jsp:getProperty property="age" name="albaVO"/>
								<%--
									//자바코드로 따졌을때 자바빈이 하는 역할이 다음과 같다. 코드 개 김^&^
									AlbasengVO albaVO = (AlbasengVO)pageContext.getAttribute("albaVO");
									if(albaVO==null){
										albaVO = new AlbasengVO();
										pageContext.setAttribute("albaVO", albaVO);
									}
									albaVO.setName("이름");
									albaVO.setAge(new Integer(request.getParameter("age")));
								--%>
								<%=albaVO %>
							
		<%
			pageContext.include("/includee/codeFragment.jsp");
		%>
	2. 정적 include(static) : 실행 전, 소스 자체가 include되는 것을 말한다. (web.xml로 먼가 조작은 하는데 권하지 않는 방식이다.)
	   	  					include 지시자 이용
	   	  					중복 코드 해결에 주로 사용.
	   	  					웹어플리케이션에 전역적으로 정적 include를 할 때,
	   	  					web.xml의 include-code/pleud등이 활용됨(개비추!!)
<%-- 	   	  					<%@include file="/includee/codeFragment.jsp"%> --%>
<%-- 	   	  					<%=varAtFrag.length() %> --%>
</pre>
</body>
</html>