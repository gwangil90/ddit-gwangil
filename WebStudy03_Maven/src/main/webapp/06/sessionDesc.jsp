<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/sessionDesc.jsp</title>
</head>
<body>
<h4>HttpSession</h4>
<pre>
	: 한 세션 내의 모든 정보를 가진 객체.
	세션?? (시간과 통로)
	통로 : 클라이언트와 서버 사이에 유효한 데이터가 전송될 수 있는 연결.
	웹어플리케이션에서는 시간의 의미로 자주 사용함
	시간 : 클라이언트가 어플리케이션 사용하기 시작한 순간부터
		  사용 종료 이벤트를 발생시킬 때까지의 시간.
		  
		  사용 시작 : 클라이언트의 브라우저로부터 최초의 요청이 발생했을 때 -> session 객체 생성
		  		**세션의 대상은 브라우저.
		  사용 종료 : 
		  	1) 명시적인 로그아웃
		  	2) 세션 만료시간 이내에 새로운 요청이 발생하지 않을 때, 기본적으로 30분이지만 재정의도 가능
			3) 브라우저를 완전히 종료했을 때 -> 이거는 case by case이다. 브라우저의 정책에 따라 달라질 수도 있다.
			session은 클라이언트에 의해 만들어진다.
			
		세션 아이디 : <%=session.getId() %>	
		세션 생성 시점 : <%=new Date(session.getCreationTime())%>	
		마지막 접속 시간 : <%=new Date(session.getLastAccessedTime())%>
		세션 만료 시간 : <%=session.getMaxInactiveInterval() %>s
		
		<%
			session.setMaxInactiveInterval(4*60);
		%>
		세션 만료 시간 조정 후 : <%=session.getMaxInactiveInterval() %>s
		<a href="sessionDesc.jsp;jsessionid=<%=session.getId()%>">쿠키 없는 상태에서 세션 유지</a>
		<!-- ; : 매트릭스 변수를 의미한다. -->
		<!-- URL재처리 방식이며 이 방식은 세션을 유지시켜주는 방식이다. -->
		<!-- 이런 방식은 세션아이디가 URL에 그대로 노출시켜버리는 방식이기 때문에 세션 위조가 가능하다. 즉, 해킹이 되어버린다는 의미이다. 하이잭킹, 인터넷 뱅킹에서는 아주 최악적인 코딩방식 -->
		
</pre>
</body>
</html>