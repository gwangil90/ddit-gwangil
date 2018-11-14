<%@page import="java.util.Map.Entry"%>
<%@page import="kr.or.ddit.web.SimpleFormProcessServlet"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="kr.or.ddit.vo.AlbasengVO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/albaList.jsp</title>
<style>
 table{
      border: 1px solid #2E2E2E;
   
   }
   td,th{
      border: 1px solid #2E2E2E;
   }
</style>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>알바생코드</th>
			<th>이름</th>
			<th>주소</th>
			<th>연락처</th>
		</tr>
	</thead>
	<tbody>
		<%	
		//깃 테스트 중입니다.
			Map<String, AlbasengVO> albaVO = (Map<String, AlbasengVO>)getServletContext().getAttribute("albasengs");
		
			for(Entry<String, AlbasengVO> entry : albaVO.entrySet()){	
			%>
			<tr>
				<td><%=entry.getKey() %></td>
				<td><%=entry.getValue().getName() %></td>
				<td><%=entry.getValue().getAddress() %></td>
				<td><%=entry.getValue().gettel() %></td>
			</tr>
			<% 	
			}
			%>
	</tbody>
</table>
</body>
</html>