<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
// 	response.setHeader("Content-Type", "text/html;charset=UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/responseDesc.jsp</title>
</head>
<body>
<h4>Http Response</h4>
<pre>
	Http의 response 패키징 방식
	1) Response Line : Response Status Code, Protocol/ver
		Response Status Code(응답 상태 코드)
		- 100 : ing..... 처리되어지지 않은 항목에 대한 대기를 의미, HTTP1.1 부터 하위 프로토콜로 websocket이 사용됨(connectful) 한 번 연결되면 연결상태, 통로를 유지
			**HTTP : Connectless : 연결지향이 아니며 이 방식에 대한 보완점이 websocket이다, Stateless
		- 200 : OK, SUCCESS(정상처리)
		- 300 : 클라이언트의 추가 액션이 필요한 경우,
			304(Not Modified) : 변경된 적이 없다는 것을 의미, 캐시데이터를 찾는다, 캐시메모리에서 꺼내 써먹어라!라고 파이어폭스는 304를 내보낸다.
			302/307(Moved) : 이동을 해버렸다? A의 위치가 어디로 변경되었다는 것을 알려주어야 한다.
		- 400 : Client 쪽 문제로 처리 실패
			404(Not Found), 400(Bad Request),
			405(Method Not Allowed),
			401(UnAuthorized)허가되지않는, 403(Forbidden)접근 허용을 하면 안되는 경우 발생, 보안처리를 위한 상태코드
		- 500 : Server 쪽 문제로 처리 실패
			500(Internal Server Error)
			
	2) Response Header : 서버나 응답데이터에 대한 부가정보(metadata)
		response header name : header value
		
	3) Response Body(Message Body) : 응답 컨텐츠
	
	** HttpServletResponse를 통한 응답 제어
	  : 서버에서 클라이언트로 전송되는 응답에 대한 모든 데이터를 가진 객체.
	
		1) 응답데이터를 전송하기 위한 출력 스트림 확보
			char stream(PrintWriter) getWriter(), 
			byte stream(ServletOutputStream) getOutPutStream()
		2)  setStatus(status_code) : 200/300 사용
		    sendError(status_code) : 400/500 사용, 서버의 에러페이지로 자동 연결.
		3)  setHeader(header_name, header_value)
			set[add]IntHeader(header_name, header_value)   
			set[add]DateHeader(header_name, long header_value)
			
			-> set는 기존의 값에 덮어씌우는거고 add는 기존의 값에 추가해주는 것
			
			응답 헤더를 설정하는 경우.
			a) MIME 설정 : Content-Type
				setHeader, setContentType, page 지시자의 contentType 속성.
				
			b) Cache 제어 : Cache-Control(HTTP/1.1), Pragma(HTTP/1.0), Expires ->웹표준화전략에 따라 세가지 모두 사용할 수 있어야 한다.
			
			Refresh는 동기처리에서만 사용가능하다.
			
			<%
			
				//캐시를 저장하지 않도록 하는 설정
// 				response.setHeader("Pragma", "no-cache"); //캐시를 남겨놓지 말라
// 				response.setHeader("Cache-control", "no-cache");
// // 				response.setHeader("Cache-control", "no-store"); //파이어폭스의 경우는 no-cache를 읽지 못하고 no-store로 사용한다.
// 				response.addHeader("Cache-control", "no-store");
// 				response.setDateHeader("expires", 0); //캐시데이터를 언제까지 살려놓겠다는 의미, 특정 날짜를 지정, 0으로 세팅한다면? -> long타입의 0은 0msec 
						
// 				캐시를 저장하도록 설정
				int maxAge = 60*60*24*7;
				response.setHeader("Pragma", "public;max-age="+maxAge);
				response.setHeader("Cache-Control", "public;max-age="+maxAge);
				Calendar today = Calendar.getInstance();
				today.add(Calendar.SECOND, maxAge);
				response.setDateHeader("Expires", today.getTimeInMillis());
			%>
			
			c) Auto Request : Refresh
			d) Page Move(Flow Control) : Location			   
</pre>
</body>
</html>