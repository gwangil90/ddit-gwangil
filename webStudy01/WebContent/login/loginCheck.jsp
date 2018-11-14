<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 1. 파라미터 확보
2. 검증(필수데이터)
3. 불통
	이동(loginForm.jsp, 기존에 입력했던 아이디를 그대로 전달할 수 있는 방식)
4. 통과
	4-1. 인증(아이디==비번)
		4-2. 인증 성공 : 웰컴페이지로 이동(원본요청을 제거하고 이동, redirect)
		4-3. 인증 실패 : 이동(loginForm.jsp, 기존에 입력했던 아이디를 그대로 전달) -->
<%
	//인코딩
	request.setCharacterEncoding("UTF-8");

	//파라미터 확보
	String id = request.getParameter("mem_id");
	String pass = request.getParameter("mem_pass");
		
	String goPage = null;
	boolean redirect = false;
	
	//검증
	if(id == null || id.trim().length()==0 || 
			pass == null || pass.trim().length()==0){
		goPage = "/login/loginForm.jsp";
		session.setAttribute("error", 1);
		redirect = true;
	} else {
		//통과 -> 인증(아이디 == 비번)
		if(id.equals(pass)){
			//인증 성공 -> welcome페이지로 이동
			session.setAttribute("id", id);
			goPage = "/";
			redirect = true;
		}else{
			//인증 실패
			goPage = "/login/loginForm.jsp";
			session.setAttribute("error", 1);
			redirect = true;
		}
	}
	
	//페이지 이동
	if(redirect){
		response.sendRedirect(request.getContextPath()+goPage);
	}else{
		RequestDispatcher rd = request.getRequestDispatcher(goPage);
		rd.forward(request, response);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/loginCheck.jsp</title>
</head>
<body>

</body>
</html>