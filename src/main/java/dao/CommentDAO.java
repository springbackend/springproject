package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CommentVO;

public class CommentDAO {

	SqlSession sqlSession;
	
	public CommentDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<CommentVO> comment_list(int b_idx){
		List<CommentVO> list = sqlSession.selectList("c.comment_list", b_idx);
		return list;
	}
	
	public int comment_write(CommentVO vo) {
		int res = sqlSession.insert("c.comment_write", vo);
		return res;
	}
	
}
