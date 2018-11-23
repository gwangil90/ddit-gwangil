<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/scopeDesc.jsp</title>
</head>
<body>
<h4>Scope(영역)</h4>
<pre>
	: 웹어플리케이션에서 데이터를 공유할 때 사용할 수 있는 메모리.
	: 각 영역은 해당 영역을 제어할 때 기본객체를 사용하고, 그 기본객체와 동일한 생명주기를 가진다.
	
	스코프는 클래스들 간의 객체를 공유하는 방식처럼 JSP끼리에서 데이터를 공유할 수 있는 방식이다.
	
	속성(attribute) : scope를 통해 공유되는 데이터(이름 : 값) -> Map과 유사
	
	1. page Scope (pageContext) : 하나의 JSP 페이지 내에서 유효한 영역
	2. request Scope (request) : 하나의 request와 동일 생명주기로 관리되는 영역
	3. session Scope (session) : 한 세션내에서 관리되는 영역
	4. application Scope (application) : 웹 어플리케이션에서 전역 데이터 관리 영역. 이 녀석은 영역은 넓은데 너무 넓은 만큼 메모리 부하가 생길 가능성이 높기 때문에 사용시 주의하자.
	<%
		pageContext.setAttribute("pageContextAttr", "페이지 영역 속성");
		request.setAttribute("requestAttr", "리퀘스트 영역 속성");
		session.setAttribute("sessionAttr", "세션 영역 속성");
		application.setAttribute("applicationAttr", "어플리케이션 영역 속성"); 
		
// 		pageContext.forward("/05/destination.jsp"); // JSP페이지가 바꼈기 때문에 pageContext는 소멸
		response.sendRedirect(request.getContextPath()+"/05/destination.jsp"); //브라우저가 사용하는 경로로 표기 //Redirect를 하면 원본요청은 stateless 특성에 의해 request는 소멸 ->null

	%>
	<%=pageContext.getAttribute("pageContextAttr")%>
	<%=request.getAttribute("requestAttr")%>
	<%=session.getAttribute("sessionAttr")%>  <!-- 얘는 브라우저가 바뀌면 다른 브라우저에서는 세션이 null뜰거임 -->
	<%=application.getAttribute("applicationAttr")%>
</pre>
</body>
</html>