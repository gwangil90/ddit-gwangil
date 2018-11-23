package kr.or.ddit.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.MemberVO;

public class MypageController implements ICommandHandler{
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if(session == null || session.isNew()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST,"로그인을 확인해주세요");
			return null;
		}
		session.getAttribute("authMember");
		MemberVO authmember = (MemberVO)session.getAttribute("authMember");
		//마이페이지 컨트롤러가 안전하게 동작하기 위해서는
		//전 단계에서 로그인 여부를 미리 확인해야 함. -- Filter 활용
		String mem_id = authmember.getMem_id();
		IMemberService service = new MemberServiceImpl();
		MemberVO member = service.retrieveMember(mem_id);
		req.setAttribute("member", member);
		
		String view = "member/memberView";
		return view;
	}
}
