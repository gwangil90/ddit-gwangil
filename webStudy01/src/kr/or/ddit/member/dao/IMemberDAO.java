package kr.or.ddit.member.dao;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {
	/**
	 * 회원 신규 등록
	 * @param member 등록할 회원의 정보를 가진 VO
	 * @return 생성 성공여부 0은실패
	 */
	public int insertMember(MemberVO member);
	/**
	 * 회원 전체 조회
	 * @return 존재하지 않는다면 size = 0
	 */
	public List<MemberVO> selectMemberList();
	/**
	 * 회원정보 상세조회
	 * @param mem_id 조회할 회원의 아이디
	 * @return 존재하지 않는다면, null반환
	 */
	public MemberVO selectMember(String mem_id);
	/**
	 * 회원정보 수정
	 * @param member 수정할 회원의 정보를 담는 VO
	 * @return 수정 성공여부 0은 실패
	 */
	public int updateMember(MemberVO member);
	/**
	 * 회원정보 삭제
	 * @param mem_id 삭제할 회원의 id정보
	 * @return 삭제 성공여부 0은 실패
	 */
	public int deleteMember(String mem_id);
}
