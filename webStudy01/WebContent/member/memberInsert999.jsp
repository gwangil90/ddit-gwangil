<%@page import="kr.or.ddit.ServiceResult"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 1.파라미터확보(특수문자고려)
    2.검증(검증룰 : member 테이블의 스키마를 확인 필수 데이터 검증은 반드시)
    3.통과
    1) 로직객체와의 의존관계 형성
    2) 로직 선택(registMember)
    PKDUPLICATED : memberForm.jsp로이동 메시지. foword(데이터가지고)
    OK : memberList.jsp로 이동 redirect
    FAILED : memberForm.jsp로 이동 foword(기존 입력데이터 메시지 공유) 
    3)
    4.불통 : memberForm.jsp로 이동.(기존 입력데이터) -->
<%
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	String mem_name = request.getParameter("mem_name");
	String mem_regno1 = request.getParameter("mem_regno1");
	String mem_regno2 = request.getParameter("mem_regno2");
	String mem_bir = request.getParameter("mem_bir");
	String mem_zip = request.getParameter("mem_zip");
	String mem_add1 = request.getParameter("mem_add1");
	String mem_add2 = request.getParameter("mem_add2");
	String mem_hometel = request.getParameter("mem_hometel");
	String mem_comtel = request.getParameter("mem_comtel");
	String mem_hp = request.getParameter("mem_hp");
	String mem_mail = request.getParameter("mem_mail");
	String mem_job = request.getParameter("mem_job");
	String mem_like = request.getParameter("mem_like");
	String mem_memorial = request.getParameter("mem_memorial");
	String mem_memorialday = request.getParameter("mem_memorialday");
	
	String url = null;
	boolean redirct = false;
	if(mem_id == null || mem_id.trim().length() == 0 || mem_pass == null || mem_pass.trim().length() == 0 ||
			mem_name == null || mem_name.trim().length() == 0 || mem_regno1 == null || mem_regno1.trim().length() == 0 ||
			mem_regno2 == null || mem_regno2.trim().length() == 0 || mem_zip == null || mem_zip.trim().length() == 0 || 
			mem_add1 == null || mem_add1.trim().length() == 0 || mem_add2 == null || mem_add2.trim().length() == 0 ||
			mem_hometel == null || mem_hometel.trim().length() == 0 || mem_comtel == null || mem_comtel.trim().length() == 0 ||
			mem_mail == null || mem_mail.trim().length() == 0 ){
		
		url = "memberForm.jsp";
		
	}else{
		MemberVO vo = new MemberVO();
		vo.setMem_id(mem_id);
		vo.setMem_add1(mem_add1);
		vo.setMem_add2(mem_add2);
		vo.setMem_bir(mem_bir);
		vo.setMem_comtel(mem_comtel);
		vo.setMem_hometel(mem_hometel);
		vo.setMem_hp(mem_hp);
		vo.setMem_job(mem_job);
		vo.setMem_like(mem_like);
		vo.setMem_mail(mem_mail);
		vo.setMem_memorial(mem_memorial);
		vo.setMem_memorialday(mem_memorialday);
		vo.setMem_name(mem_name);
		vo.setMem_pass(mem_pass);
		vo.setMem_regno1(mem_regno1);
		vo.setMem_regno2(mem_regno2);
		vo.setMem_zip(mem_zip);
		
		IMemberService service = new MemberServiceImpl();
		String result = service.regisMember(vo).toString();
		if("OK".equals(result)){
			url = "memberList.jsp";
			redirct = true;
		}else{
			url = "memberForm.jsp";
		}
	}
	
	if(redirct){
		response.sendRedirect(url);
	}else{
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>