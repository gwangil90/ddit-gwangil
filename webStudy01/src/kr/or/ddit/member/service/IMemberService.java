package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.MemberVO;

/**
 * 회원 신규 등록
 * @param member 
 * @return PKDUPLICATED, OK, FAILED
 */
public interface IMemberService {
	/**
	 * 회원 신규등록
	 * @param member
	 * @return PKDUPLICATED, OK, FAILED
	 */
	public ServiceResult regisMember(MemberVO member);
	/**
	 * 회원 목록 조회
	 * @return 존재하지않을때 size 0
	 */
	public List<MemberVO> retrieveMemberList();
	/**
	 * 회원 정보 상세 조회
	 * @param mem_id 조회할 회원의 아이디
	 * @return 존재하지 않는다면. CommonException 발생
	 */
	public MemberVO retrleveMember(String mem_id);
	/**
	 * 회원 정보 수정
	 * @param member
	 * @return CommonException, Invalidpassword, ok, failed
	 */
	public ServiceResult modifyMember(MemberVO member);
	/**
	 * 회원 탈퇴
	 * @param member
	 * @return CommonException, Invalidpassword, ok, failed 
	 */
	public ServiceResult removeMember(MemberVO member);
}
