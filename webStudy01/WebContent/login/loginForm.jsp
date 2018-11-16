<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//foward로 돌아온 아이디 세팅을 위한 코드
	String failedId = request.getParameter("mem_id");
	Integer error = (Integer) session.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/loginForm.jsp</title>
<script>
	<%
		if(error!=null){
	%>
			alert("아이디나 비밀번호에 오류가 있음.");
	<%	
			session.removeAttribute("error");
		}
	%>
</script>
</head>
<body>
<form action="<%=request.getContextPath() %>/login/loginCheck.jsp" method="post">
	<ul>
		<li>
			아이디 : <input type="text" name="mem_id" value="<%=Objects.toString(failedId, "")%>">
			<input type="checkbox" name="idChecked" value="idSaved">아이디기억하기
		</li>
		<li>
			비밀번호 : <input type="password" name="mem_pass">
			<input type="submit" value="로그인"> 
		</li>
	</ul>
</form>
</body>
</html>