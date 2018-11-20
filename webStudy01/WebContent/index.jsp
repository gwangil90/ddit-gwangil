<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.web.modulize.ServiceType"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO authMember = (MemberVO)session.getAttribute("authMember");
	String cmdParam = request.getParameter("command");
	int statusCode = 0;
	String includePage = null;
	if(StringUtils.isNotBlank(cmdParam)){
		try{
			ServiceType sType = ServiceType.valueOf(cmdParam.toUpperCase()); //받아오는 값이 대문자인지 소문자인지 모르니까 Upper!
			includePage = sType.getServicePage();
		}catch(IllegalArgumentException e){ //서비스 될 수 있는게 없다면?
			statusCode = HttpServletResponse.SC_NOT_FOUND; //404
		}
	}
	if(statusCode != 0){
		response.sendError(statusCode);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<div id="top">
<jsp:include page="/includee/header.jsp"/> <!-- 태그처럼 보이는데 사실은 자바코드이다, 서버사이드 코드, 얘를 JSP에서 제공해주는 액션태그라고 한다. -->
<%-- 	<iframe src="<%=request.getContextPath() %>/includee/header.jsp"></iframe> <!-- 얘는 클라이언트사이드 방식인데 이렇게 처리하면 얘를 불러올 때마다 요청이 일일이 일어난다. 서버입장에서 이런 방식은 부하가 커지는 문제가 발생 --> --%>
</div>
<div id="left">
<jsp:include page="/includee/left.jsp"/>
<%-- <iframe src="<%=request.getContextPath() %>/includee/left.jsp"></iframe> --%>
</div>


<div id="body">
<%
	if(StringUtils.isNotBlank(includePage)){
		pageContext.include(includePage);
	}else{
		%>
		<h4>웰컴 페이지</h4>
		<pre>
		처음부터 웰컴 페이지로 접속하거나,
		로그인에 성공해서 웰컴 페이지로 접속하는 경우의 수가 있음.
		<%
			if(authMember!=null){
		 %>	
			<%=authMember.getMem_name() %>님 로그인 상태, <a href="<%=request.getContextPath() %>/login/logout.jsp">로그아웃</a>
		<%
			}else{
		%>
		<a href="<%=request.getContextPath() %>/login/loginForm.jsp">로그인하러 가기</a>
		<%
			}
		%>
	</pre>
		
		<%
		
	}
%>
</div>


<div id="footer">
	<%
		pageContext.include("/includee/footer.jsp");
	%>
<%-- 	<iframe src="<%=request.getContextPath() %>/includee/footer.jsp"></iframe> --%>
</div>
</body>
</html>