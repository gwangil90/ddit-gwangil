<%@page import="kr.or.ddit.web.calculate.BrowserType"%>
<%@page import="kr.or.ddit.web.calculate.AdaptType"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userAgent = request.getHeader("user-agent");
	System.out.println(userAgent);
	
	String adapattern = "당신의 접속기기는 %s 입니다";
	String bropattern = "당신의 접속브라우저는 %s 입니다";
	String browser = null;
	String adapter = null;
	
	//접속방법 android, ios, window
	AdaptType adapt = AdaptType.selectType(userAgent);
	adapter = String.format(adapattern, adapt.getAdaptType());
	
	//접속브라우저 firefox, chrome explorer
	BrowserType browsertype = BrowserType.selectBrowserType(userAgent);
	browser = String.format(bropattern, browsertype.getBrowserType());



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
	$(document).ready(function() { 
	});
</script>
</head>
<body>
<!-- 클라이언트의 시스템과 브라우저에 대한 정보를 확인.
클라이언트의 시스템이
데스크탑이라면, "당신의 시스템은 데스크탑입니다." 
브라우저가 chrome이라면 "당신의 브라우저는 크롬입니다."
브라우저가 firefox이라면 "당신의 브라우저는 파이어폭스입니다."
와 같은 형태의 메세지를 출력 -->

<form name="ff">
</form>

<div id="msgArea">
	<%=adapter %><br>
	<%=browser %>
</div>

</body>
</html>