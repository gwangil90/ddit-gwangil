<%@page import="kr.or.ddit.utils.CookieUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Cookie (HttpCookie)활용</h4>
<pre>
	: http의 stateless 특성을 부완하여 최소한의 상태정보를 클라리언트 쪽에 저장하는 개념
	
	1. 쿠키 객체 생성(쿠키명/쿠키값)
	2. 생성된 쿠키를 클라이언트쪽으로 전송
	<%
		/* String cookievalue = URLEncoder.encode("한글 쿠키값","UTF-8");
		out.println(cookievalue);
		Cookie cookie = new Cookie("koreanCookie",cookievalue);
		response.addCookie(cookie); */
		Cookie cookie = CookieUtil.createCookie("koreanCookie", "한글 쿠키값");
	%>
	3. 브라우저가 자기 쿠키저장소에 응답이 실려있는 쿠키를 저장.
	
	4. 다음번 요청이 발생시 저장되어있던 쿠키가 서버쪽으로 재전송.
	
	5. 전송된 쿠키를 통해 상태 복원
	<%
	/* 	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie tmp : cookies){
			if("koreanCookie".equals(tmp.getName())){
				out.println(tmp.getValue());
			}
		}
	} */
	out.println(new CookieUtil(request).getCookieValue("koreanCookie"));
	%>
	
</pre>
</body>
</html>