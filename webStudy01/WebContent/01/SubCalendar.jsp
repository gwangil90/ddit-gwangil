<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int action = 0;
	int year = Integer.parseInt(request.getParameter("year"));
	
	if(request.getParameter("action") != null){
		if(Integer.parseInt(request.getParameter("action")) == 1){
			year++;
		}else{
			year--;
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin-left: auto;
		margin-right: auto;
	}
	a:link, a:visited{
		text-decoration: none;
		color: gray;
	}
	td{
		text-align: center;
		font-size: 100px;
		padding: 90px;
	}
</style>
</head>
<body>
<table>
	<tr>
		<td><a href="SubCalendar.jsp?year=<%=year%>&action=0">◀</a></td>
		<td><%=year %>년</td>
		<td><a href="SubCalendar.jsp?year=<%=year%>&action=1">▶</a></td>
	</tr>
</table>
<table>
	<%
		out.println("<tr>");
		for(int i = 1; i <= 12; i++){
			out.println("<td><a href = '"+request.getContextPath()+"/?command=calendar&Mnum="+i+"&Ynum="+year+"'>"+i+"</a></td>");
			if(i % 4 == 0){
				out.println("</tr>");
				out.println("<tr>");
			}
		}
		out.println("</tr>");
	%>
</table>
</body>
</html>