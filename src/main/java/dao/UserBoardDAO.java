package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import vo.BoardVO;

public class UserBoardDAO {

	SqlSession sqlSession;

	public UserBoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BoardVO> viewMyPosts(String id) {
		List<BoardVO> list = sqlSession.selectList("ub.viewMyPosts", id);
		return list;
	}

	public List<BoardVO> viewMyComments(String id) {
		List<BoardVO> list = sqlSession.selectList("ub.viewMyComments", id);
		return list;
	}

}
