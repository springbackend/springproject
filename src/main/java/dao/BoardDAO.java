package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	 public List<BoardVO> selectList(){ //List<BoardVO> list =
		 List<BoardVO> list = sqlSession.selectList("b.board_list");
		 return list; 
	 }
	 
	 public int board_upload(BoardVO vo) {
		 int res = sqlSession.insert("b.board_write", vo);
		 return res;
	 }
	
}
