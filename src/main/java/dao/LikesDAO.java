package dao;

import org.apache.ibatis.session.SqlSession;

import vo.LikesVO;

public class LikesDAO {
	SqlSession sqlSession;
	public LikesDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public LikesVO check_like(LikesVO vo) {
		LikesVO resultVO = sqlSession.selectOne("l.check_like", vo);
		return resultVO;
	}
	
	public int insert(LikesVO vo) {
		int res = sqlSession.insert("l.insert", vo);
		return res;
	}
	
	public int delete(LikesVO vo) {
		int res = sqlSession.delete("l.delete", vo);
		return res;
	}
	
	public int count_like(int b_idx) {
		int res = sqlSession.selectOne("l.count_like", b_idx);
		return res;
	}
}
































