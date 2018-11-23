<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IMemberService service = new MemberServiceImpl();
	List<MemberVO> memberList = service.retrieveMemberList();
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
<h4>회원 목록</h4>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>회원아이디</th>
			<th>회원명</th>
			<th>주소</th>
			<th>이메일</th>
			<th>마일리지</th>
		</tr>
	</thead>
	<tbody>
		<%
			if(memberList == null || memberList.size() == 0){
				%>
				<tr><td colspan='5'>비어있음</td></tr>
				<%		
			}else{
				for(int i = 0; i < memberList.size(); i++){
				%>
					<tr>
						<td><%=memberList.get(i).getMem_id()%></td>
						<td><a href="<%=request.getContextPath()%>/member/memberView.jsp?who=<%=memberList.get(i).getMem_id()%>"><%=memberList.get(i).getMem_name()%></a></td>
						<td><%=memberList.get(i).getMem_add1()+memberList.get(i).getMem_add2() %></td>
						<td><%=memberList.get(i).getMem_mail() %></td>
						<td><%=memberList.get(i).getMem_mileage() %></td>
					</tr>
				<%}
			}
		%>
	</tbody>
</table>
</div>
</body>
</html>