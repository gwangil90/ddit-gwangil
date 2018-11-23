<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public Map<String, String[]> singerMap = new LinkedHashMap<>();
{
	singerMap.put("B001",new String[]{"jennie","/WEB-INF/blackpink/jennie.jsp"});
	singerMap.put("B002",new String[]{"jisoo","/WEB-INF/blackpink/jisoo.jsp"});
	singerMap.put("B003",new String[]{"lisa","/WEB-INF/blackpink/lisa.jsp"});
	singerMap.put("B004",new String[]{"rose","/WEB-INF/blackpink/rose.jsp"});
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/bpForm.jsp</title>
<script type="text/javascript">
	function eventHandler(){
		/* var form = document.forms[0];
		form.submit();
		return false; */
		document.bpform.submit();
	}
</script>
</head>
<body>
<form name="bpform" action="<%=request.getContextPath() %>/05/getBP.jsp">
	<select name="member" onchange="eventHandler();">
		<option value="">멤버선택</option>
		<%
			String pattern = "<option value='%s'>%s</option>";
			for(Entry<String, String[]> entry : singerMap.entrySet()){ //:기준 오른편은 반복의 대상이 되는 컬렉션들이 온다.
				out.println(String.format(pattern, entry.getKey(), entry.getValue()[0]));
			}
		%>
	</select>

</form>
</body>
</html>