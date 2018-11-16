<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	File[] files = (File[])request.getAttribute("file");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileBrowser</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
	$(function() {
		$("li").on("dblclick",function(){
			var value = $(this).attr("value");
			$.ajax({
				url : "<%=request.getContextPath()%>/fileBrowser.do",
				method : "get",
				data : {
					url : value
				},
				dataType : "json",
				success : function(resp) {
					$("#ul").empty();
					$("#ul").html(resp);
				},
				error : function() {
					alert("실패");
				}
			})
		})
	})
</script>
</head>
<body>
<form id="fileForm">
	<ul id = "ul">
	<%
		for ( int i = 0; i < files.length; i++ ) {
	    	if ( !files[i].isFile()){
	    		out.println(String.format("<li value='%s'>%s</li>", files[i].getParent()+"/"+files[i].getName(), files[i].getName()));
	   		}else{
	   			out.println(String.format("<li value='%s'>%s</li>", files[i].getParent()+"/"+files[i].getName(), files[i].getName()));
	   		}
		}
	%>
	</ul>
</form>
</body>
</html>