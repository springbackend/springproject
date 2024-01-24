package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;

	public List<MemberVO> selectList() {
		List<MemberVO> list = sqlSession.selectList("m.select_list");
		return list;
	}

	public MemberVO selectOne() {
		MemberVO vo = sqlSession.selectOne("m.select_one");
		return vo;
	}
}