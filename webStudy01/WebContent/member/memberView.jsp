<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String who = request.getParameter("who");
	MemberVO member = null;
	if (who != null) {
		IMemberService service = new MemberServiceImpl();
		member = new MemberVO();
		member = service.retrleveMember(who);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<table class="table table-bordered">
		<%
			if (member == null) {
		%>
		<tr>
			<td colspan='5'>비어있음</td>
		</tr>
		<%
			} else {
		%>
		<tr>
			<th>아이디</th>
			<td><%=member.getMem_id()%></td>
		</tr>
		<tr>
			<th>비번</th>
			<td><%=member.getMem_pass()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=member.getMem_name()%></td>
		</tr>
		<tr>
			<th>직업</th>
			<td><%=member.getMem_job()%></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><%=member.getMem_bir()%></td>
		</tr>
		<tr>
			<th>주민1</th>
			<td><%=member.getMem_regno1()%></td>
		</tr>
		<tr>
			<th>주민2</th>
			<td><%=member.getMem_regno2()%></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><%=member.getMem_zip()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=member.getMem_add1()%></td>
		</tr>
		<tr>
			<th>주소2</th>
			<td><%=member.getMem_add2()%></td>
		</tr>
		<tr>
			<th>집전화</th>
			<td><%=member.getMem_hometel()%></td>
		</tr>
		<tr>
			<th>회사전화</th>
			<td><%=member.getMem_comtel()%></td>
		</tr>
		<tr>
			<th>폰번</th>
			<td><%=member.getMem_hp()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=member.getMem_mail()%></td>
		</tr>
		<tr>
			<th>기념일명</th>
			<td><%=member.getMem_memorial()%></td>
		</tr>
		<tr>
			<th>기념날짜</th>
			<td><%=member.getMem_memorialday()%></td>
		</tr>
		<tr>
			<th>보유마일리지</th>
			<td><%=member.getMem_mileage()%></td>
		</tr>
		<%
			}
		%>
	</table>
</div>
</body>
</html>