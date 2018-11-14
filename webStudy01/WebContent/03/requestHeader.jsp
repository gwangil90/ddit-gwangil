<%@page import="java.util.Locale"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String lang = request.getParameter("lang");
	System.out.println(lang);
	Locale currentLocale = request.getLocale();
	if(lang!=null && lang.trim().length()!=0){
		currentLocale = Locale.forLanguageTag(lang);
		System.out.println(currentLocale.toLanguageTag());
	}
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/requestHeader.jsp</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
	$(function() {
		//콤보 체인지이벤트
		$("[name='lang']").on("change", function() {
			document.langForm.submit();
		});
	});
</script>
</head>
<body>
	<%
		Locale[] locales = Locale.getAvailableLocales();
	%>
<form action="" name="langForm">
	<select name="lang">
		<option value="" selected="selected">언어선택</option>
		<%
			String optPattern = "<option value='%s' %s>%s</option>";
			for(Locale tmp : locales){
				String value = tmp.toLanguageTag();
				String text = tmp.getDisplayLanguage();
				String selected = "";
				
				if(currentLocale.equals(tmp)){
					selected = "selected='selected'";
				}
				
				if(text!=null && text.trim().length() != 0){
					out.println(String.format(optPattern, value, selected, text));
				}
			}
		%>
	</select>
</form>
<ul>
	<li>
		현재 사용자의 언어와 국가정보
		: <%=request.getLocale() %>
	</li>
	<li>
		<%
			//ex) ko-KR : 로케일 문자 언어 지역(국가)
			Locale locale = currentLocale; 
			String country = locale.getDisplayCountry();
			String language = locale.getDisplayLanguage();
		%>
				
		Locale 객체 활용
		: <%=country%>, <%=language%>
	</li>
</ul>


	<table>
		<thead>
			<th>헤더명</th>
			<th>헤더값</th>
		</thead>
		
		<tbody>
			<%
				Enumeration<String> names =  request.getHeaderNames();
				String pattern = "<tr><td>%s</td><td>%s</td></tr>";
				while(names.hasMoreElements()){
					String headerName = names.nextElement();
					String headerValue = request.getHeader(headerName);
					out.println(String.format(pattern, headerName, headerValue));
				}
			%>		
		</tbody>
	</table>
</body>
</html>