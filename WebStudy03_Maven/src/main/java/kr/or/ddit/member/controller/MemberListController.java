package kr.or.ddit.member.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.mvc.ICommandHandler;
import kr.or.ddit.vo.MemberVO;

public class MemberListController implements ICommandHandler{
	
	public String process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		1. 요청과의 매핑 설정
//		2. 요청 분석(주소, 파라미터, 메소드, 헤더들...)
//		3. B.L.L 와의 의존관계 형성
		IMemberService service = new MemberServiceImpl();
//		4. 로직 선택
//		5. 컨텐츠(Model) 확보
		List<MemberVO> memberList = service.retrieveMemberList();
//		6. V.L 를 선택
		String view = "/member/memberList";
//		7. Scope 를 통해 Model 공유
		req.setAttribute("memberList", memberList);
//		8. 이동 방식을 결정하고, V.L로 이동.
		return view;
	}
}


















