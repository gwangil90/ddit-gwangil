<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Brush+Script');
	*{
		font-family: 'Nanum Brush Script', cursive;
		font-size: 20px;
		text-align: center;
	}	
	table{
		border: 2px solid #2E2E2E;
	}
	td{
		border: 2px solid #2E2E2E;
	}
</style>
</head>
<body>
<%
	String minStr = request.getParameter("minDan");
	String maxStr = request.getParameter("maxDan");
	
	if(minStr == null || !minStr.matches("\\d")
			|| maxStr == null || !maxStr.matches("\\d")){
		response.sendError(400); //HttpServletResponse.SC_BAD_REQUEST
		return; //눈에 보이지 않지만 jsp서블릿상에 메서드가 감싸져 있는 상황이므로 return이 필요
	}
%>
<form action="<%=request.getContextPath()%>/02/numberTest.jsp">
	최소단:<input type="number" name="minDan" value="<%=minStr%>"/>
	최대단:<input type="number" name="maxDan" value="<%=maxStr%>"/>
	<input type="submit" value="구구단"/>
</form>
<table>
	<%
		int minDan = Integer.parseInt(minStr);
		int maxDan = Integer.parseInt(maxStr);
		String pattern = "%d * %d = %d";
		for(int dan=minDan; dan<=maxDan; dan++){
			%>
			<tr>
			<% 
			for(int i=1; i<=9; i++){
				%>
				<td><%= String.format(pattern, dan, i,(dan*i))%></td>
				<%
			}
			%>
			</tr>
			<% 
		}
	%>
</table>
</body>
</html>