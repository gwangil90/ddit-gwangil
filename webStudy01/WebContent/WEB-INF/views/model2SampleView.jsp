<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String model = (String)request.getAttribute("model");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web-inf/views/model2SampleView.jsp</title>
</head>
<body>
<pre>
	모델2 구조를 이용하고 있고, 컨트롤러를 거친 이후에 응답이 생성되는 영역.
	<%
		if(model != null){
			out.println(model);
		}
	%>
</pre>
</body>
</html>