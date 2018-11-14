<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Map<String, String[]> singerMap = new LinkedHashMap<>();

	{
		singerMap.put("0001", new String[]{"RM", "/WEB-INF/bts/rm.jsp"});
		singerMap.put("0002", new String[]{"SUGAR", "/WEB-INF/bts/sugar.jsp"});
		singerMap.put("0003", new String[]{"JIN", "/WEB-INF/bts/jin.jsp"});
		singerMap.put("0004", new String[]{"JUNGKOOK", "/WEB-INF/bts/jungkook.jsp"});
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/btsForm.jsp</title>
<script>
	
	function eventHandler() {
		var form = document.forms[0];
	    form.submit();
	}
	
</script>
</head>
<body>
<form action="<%=request.getContextPath() %>/05/getBTS.jsp">
	<select name="member" onchange="eventHandler()">
		<option value="">멤버 선택</option>
		<%
			String optformat = "<option value='%s'>%s</option>";
			for(Entry<String,String[]> tmp : singerMap.entrySet()){
				String text = tmp.getValue()[0];
				String value = tmp.getKey();
				out.println(String.format(optformat, value, text));
			}
		%>
		<option vaule="1">함정</option>	
		</select>
</form>

</body>
</html>