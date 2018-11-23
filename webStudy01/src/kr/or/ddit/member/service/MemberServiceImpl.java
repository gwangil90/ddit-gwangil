package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements IMemberService {
	//의존 객체를 직접 생성하는 방식 : 결합력 최상
	IMemberDAO memberDAO = new MemberDAOImpl();
	
	@Override
	public ServiceResult regisMember(MemberVO member) {
		ServiceResult result = null;
		if(memberDAO.selectMember(member.getMem_id())==null) {
			//중복이 아니면 insert
			int rowCnt = memberDAO.insertMember(member);
			//성공실패 ok failed
			if(rowCnt > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			//id중복여부 tk
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		List<MemberVO> memberlist = memberDAO.selectMemberList();
		return memberlist;
	}

	@Override
	public MemberVO retrleveMember(String mem_id) {
		return null;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

}
