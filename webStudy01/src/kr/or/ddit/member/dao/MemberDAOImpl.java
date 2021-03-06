package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.db.ibatis.CustomSqlMapClientBuilder;
import kr.or.ddit.vo.MemberVO;

public class MemberDAOImpl implements IMemberDAO {

	SqlMapClient sqlMapClient = CustomSqlMapClientBuilder.getSqlMapClient(); //그만 바꿔 말하고 젭알 끝내줘 씨발 6시까지 가겠네 씨벌
	@Override
	public MemberVO selectMember(String mem_id) {
		 try {
			MemberVO member = (MemberVO)sqlMapClient.queryForObject("Member.selectMember", mem_id);
			return member;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public int insertMember(MemberVO member) {
		try {
			return sqlMapClient.update("Member.insertMember",member);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public List<MemberVO> selectMemberList() {
		try {
			List<MemberVO> list = sqlMapClient.queryForList("Member.selectMemberList");
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteMember(String mem_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
