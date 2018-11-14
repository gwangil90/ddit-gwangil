<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/flowControl.jsp</title>
</head>
<body>
<h4>흐름제어(페이지 이동)</h4>
<pre>
	1.request Dispatch : 원본 요청에 대한 정보를 페이지를 이동하는 과정에서 전달해주는 방식.
		1) Foward : 페이지를 이동한 이후 최종 도착지에서 응답데이터가 전송
		<%
			//request를 Dispatch 할떄 직접제어하는 메소드 -> getRequestDispatcher()
			//RequestDispatcher rd = request.getRequestDispatcher("/05/destination.jsp");
			//rd.forward(request, response);			
/* 			Web Container 차원에서 페이지 이동만 있다. 
			실제로 웹 브라우저는 다른 페이지로 이동했음을 알 수 없다. 
			그렇기 때문에, 웹 브라우저에는 최초에 호출한 URL이 표시되고 이동한 페이지의 URL 정보는 볼수 없다.
			동일한 웹 컨테이너에 있는 페이지로만 이동할수 있다. 
			현재 실행중인 페이지와 Forward에 의해 호출될 페이지는 request와 response 객체를 공유한다. */
			
		%>
		2) Include : 페이지를 이동한 후 도착지에서 생성된 결과데이터(버퍼의 내용)을 가지고,
					 출발지(시작페이지)로 다시돌아오는 구조.
					 최종 응답데이터는 시작페이지에서 전송.
		<%
			//rd.include(request, response);
		%>
	
	2. Redirect : 
		1) 원본 요청이 시작페이지로 전송
		2) 해당 페이지에서 body가 없고, 
			상태코드가 (302,307), Location 헤더를 가지고 응답 전송
			Stateless 특성에 따라 서버에서는 최초의 요청정보가 삭제.
		3) 클라이언트쪽에서 Location 방향으로 새로운 요청이 발생.
		4) 최종 응답데이터는 3)번의 새로운 요청에대한 응답으로 전송
		<%
			//최초의 요청 a - body없음
			//2번째 요청에대한 response = body 있음
			//즉 응답이 b에서 나왔다는걸 암
		/* 
			Web Container 는 Redirect 명령이 들어오면 웹 브라우저에게 다른 페이지로 이동하라고 명령을 내린다. 
			그러면 웹 브라우저는 URL을 지시된 주소로 바꾸고 그 주소로 이동한다. 다른 웹 컨테이너에 있는 주소로 이동이 가능하다. 
			새로운 페이지에서는 request 와 response 객체가 새롭게 생성된다.
		 */
			response.sendRedirect(request.getContextPath()+"/05/destination.jsp");
		%>
</pre>
</body>
</html>