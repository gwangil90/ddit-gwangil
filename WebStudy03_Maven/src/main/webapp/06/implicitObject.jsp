<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/implicitObject.jsp</title>
</head>
<body>
<h4>기본 객체(내장 객체)</h4>
<pre>
		** pageContext(PageContext) (잘 안 쓰지만 중요하데). 현재 JSP에 대한 모든 정보를 가지고 있다. 
									JSP 페이지와 관련된 모오오오오든!! 정보를 가진 객체. 그 모든 것 안에는 아래 8가지의 모든 객체가 포함된다.
									즉, 제일 먼저 만들어지는 객체인 셈이다.
									가장 생명주기가 짧다.
		
		request(HttpServletRequest) : HTTP 프로토콜에 대한 요청의 정보(세가지 파트 RL, RH, RB)를 가지고 있다.
									    요청과 클라이언트에 정보를 캡슐화한 객체
									  pageContext 다음으로 생명주기가 짧다.
		
		response(HttpServletResponse) : 응답에 대한 정보(RL, RH, RB)를 가지고 있다. 캡슐화된 객체
		
		out(JSPWrite) : 출력버퍼에 데이터를 기록하거나 버퍼를 제어하기 위해 사용되는 출력 스트림.
		
		session(HttpSession) : 데이터베이스에서 자주 사용한다. 커넥션 생성에서 종료까지의 텀을 세션 즉, 하나의 어플리케이션을 시작에서 끝내는 이벤트가 이루어지는 시간을 세션이라고 한다.
							       한 세션 내에서 발생하는 모든 정보를 캡슐화한 객체, 연결의 통로라고도 쓰인다만 조금 애매한 정의여서 시간이라는 의미로 쓰인다.
							       특정클라이언트가 어떤 브라우저를 통해서 서버를 이용하려는 그 순간 세션이 생성. 
		
		application(ServletContext) : 클래스명과 변수명이 매치가 되지 않는것처럼 보이지만 
									  application은 하나의 서버사이드에 대한 정보를 가지고 있는 객체, Servletcontext는 현재 서블릿이 운영되고 있는 그 상황을 뜻한다.
									   컨텍스트(어플리케이션)와 서버에 대한 정보를 가지고 있는 객체, 기본객체 중에서 제일 오래 살아남는 녀석
		<%=application.hashCode() %>							   
		어플리케이션 기본객체는 싱글톤이다.
									   
		config(ServletConfig) : JSP는 곧 서블릿, 그렇다면 서블릿의 web.xml처럼 등록과 매핑정보가 있어야하는데 JSP에서 그 역할을 config가 하는 셈이다.
								서블릿 등록과 관련된 정보를 가진 객체
								
		page(Object) : JSP에 대한 싱글톤 객체를 뜻하며 page는 JSP로 따지면 자기 자신을 뜻함, this랑 똑같다. 
					      근데 page의 경우는 Object타입이어서 캐스팅과정이 필요한데 page자체에 대한 객체정보? 이런걸 몰라서 웬만하면 this를 쓰는게 편한 경우가 많다고 한다. 
					      현재 JSP 페이지에 대한 레퍼런스
					      
		exception(Throwable) : 일반적인 상황은 아니고 에러를 처리할 수 있는 페이지에서 활성화 된다. isErrorPage="true" -> 해당 페이지에서 에러를 처리하겠다.
							       발생한 예외에 대한 정보를 가진 객체
							       예외(에러)가 발생한 경우, 에러를 처리하는 페이지에서 사용됨 (page지시자의 isErrorPage로 활성화)   
							       
		<%=exception %> 
</pre>
</body>
</html>