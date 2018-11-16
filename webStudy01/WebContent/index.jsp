<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="kr.or.ddit.web.homepage.LeftMenu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	if(id == null || id.trim().length() ==0){
		id = "";
	}
	String cmdParam = request.getParameter("command");
	int statusCode = 0;
	String includePage = null;
	if(StringUtils.isNotBlank(cmdParam)){
		try{
			LeftMenu menu = LeftMenu.valueOf(cmdParam.toUpperCase());
			includePage = menu.getLink();
		}catch(IllegalArgumentException e){
			statusCode = HttpServletResponse.SC_NOT_FOUND;
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
	<jsp:include page="/include/header.jsp"></jsp:include>
	<%-- <iframe src="<%=request.getContextPath() %>/include/header.jsp"></iframe> --%>
</div>
<div id="left">
	<jsp:include page="/include/left.jsp"></jsp:include>
</div>
<div id="body">
<%if(includePage == null){%>
<h4>웰컴 페이지</h4>
<pre>
	처음부터 웰컴 페이지로 접속하거나, 로그인에 성공해서 웰컴 페이지로 접속하는 경우의 수가 있음.
	<%
	if(id.trim().length() > 0){
	%>
	<%= id%>님 환영합니다., <a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a>
	<%}else{%>
		<a href="<%=request.getContextPath()%>/login/loginForm.jsp">로그인하러가기</a>
	<%}%>
</pre>
<%}else{
		pageContext.include(includePage);
  }%>
</div>
<div id="footer">
	<%
		pageContext.include("/include/bottom.jsp");
	%>
</div>
</body>
</html>