package dao;

import org.apache.ibatis.session.SqlSession;

import vo.LikesVO;

public class LikesDAO {
	SqlSession sqlSession;
	public LikesDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public LikesVO selectOne(int b_idx) {
		System.out.println(b_idx);
		LikesVO vo = sqlSession.selectOne("l.likes_select_one", b_idx);
		return vo;
	}
	
	public int insert(LikesVO vo) {
		int res = sqlSession.insert("l.insert", vo);
		return res;
	}
	
	public int delete(LikesVO vo) {
		int res = sqlSession.delete("l.delete", vo);
		return res;
	}
}
