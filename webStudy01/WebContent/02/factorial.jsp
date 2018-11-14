<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	BigDecimal factorial(int operand){
		
		//음수 받았을때 처리 -1반환
		if(operand < 0){
			throw new IllegalArgumentException("음수는 팩토리얼 연산 불가");	
		}else if (operand <= 1){
			return new BigDecimal(operand);
		}else{
			return new BigDecimal(operand).multiply(factorial(operand-1));
		}
		//System.out.print(result);
	
		
	}
%>    
<%
	boolean chk = false;
	String operStr = request.getParameter("operand");
	System.out.println(operStr);
	
	if(operStr !=null && operStr.matches("\\d{2}|100")){
		System.out.println("여길왜탐?");
		chk = true;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02/factorial.jsp</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/02/factorial.jsp">
	Factorial operand : <input type="number" min="1" max="100" name="operand" value="<%=operStr %>" />
	<button type="submit">전송</button>
</form>

<% 	
	if(chk){
		int operand = Integer.parseInt(operStr);
%>
<div>
	<%=factorial(operand) %>
</div>
<%
	}
%>
</body>
</html>