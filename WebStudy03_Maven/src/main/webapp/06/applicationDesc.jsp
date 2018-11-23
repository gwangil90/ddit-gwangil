<%@page import="java.io.InputStream"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Input"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/applicationDesc.jsp</title>
</head>
<body>
<h4>ServletContext</h4>
<pre>
	<%=application.hashCode() %>
	<a href="<%=request.getContextPath() %>/06/implicitObject.jsp">implicitObject.jsp로 이동</a>
	<a href="<%=request.getContextPath() %>/desc">DescriptionServlet으로 가기</a>
	: 컨텍스트와 해당 컨텍스트를 운영(관리)중인 서버에 대한 정보를 가진 객체.
	
	1. 서버에 대한 정보 획득
	<%=application == getServletContext() %> -> JSP가 곧 서블릿임을 보여주는 것
	<%=application.getServerInfo()%> -> 서버에 대한 정보를 출력
	<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %> -> 서블릿 스펙의 정보를 확인하고 싶을 때 사용
	<%=application.getMimeType("test.hwp") %> -> 해당파일의 마임타입을 출력
	
	2. 로그 기록을 위해 사용(logging을 할 것을 의미)
	<%
		application.log("명시적으로 기록한 로그 메시지"); //출력데이터로는 나가지 않고 콘솔로 확인 가능한 로그메시지이다.
	%>
	
	3. 컨텍스트 파라미터(어플리케이션의 초기화 파라미터) 획득
	파라미터란? 누군가가 넘겨주고 있는 데이터 자체를 의미
	컨텍스트는 명령을 수행하는 자, 다른말로 하면 어플리케이션
	
	<%=application.getInitParameter("param1")%> 
	<%
		Enumeration<String> names = application.getInitParameterNames();
		while(names.hasMoreElements()){
			out.println(application.getInitParameter(names.nextElement()));
		}
	%>
	
	4. 웹리소스를 획득 : /webStudy01/images/Taeyeon1.jpg
	<%=application.getRealPath("/images/Taeyeon1.jpg") %>
	<%
		String fileSystemPath = application.getRealPath("/images/Taeyeon1.jpg");
		File srcFile = new File(fileSystemPath);
		File targetFolder = new File(application.getRealPath("/06"));
		File targetFile = new File(targetFolder, srcFile.getName());
		System.out.println(targetFile.exists());
		
		
		//이미지 파일을 카피해서 /06/경로에 붙여놓기
		int pointer = -1;
		byte[] buffer = new byte[1024]; //처리 속도를 빠르게
		try(
// 			FileInputStream fis = new FileInputStream(srcFile);
			InputStream fis = application.getResourceAsStream("/images/Taeyeon1.jpg"); //굳이 스트림을 개방하지 않더라도 이 방식으로 가지고 올 수 있다.
			FileOutputStream fos = new FileOutputStream(targetFile);
		){
			while((pointer = fis.read(buffer))!=-1){
				fos.write(buffer,0,pointer);
			}
		}
		System.out.println(targetFile.exists());
	%>

</pre>
<img src="<%=request.getContextPath() %>/06/Taeyeon1.jpg">
<img src="<%=request.getContextPath() %>/images/Taeyeon1.jpg">
</body>
</html>