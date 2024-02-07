package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	 public List<BoardVO> selectList(){ 
		 List<BoardVO> list = sqlSession.selectList("b.board_list");
		 return list; 
	 }
	 
	 public List<BoardVO> selectList(HashMap<String, Integer> map){ 
		 List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		 return list; 
	 }
	 
	 public BoardVO board_one(int b_idx) {
		 BoardVO vo = sqlSession.selectOne("b.board_one", b_idx);
		 return vo;
	 }
	 
	 public int board_upload(BoardVO vo) {
		 int res = sqlSession.insert("b.board_write", vo);
		 return res;
	 }
	 
	 public int increase_thumb(int b_idx) {
		 int res = sqlSession.update("b.increase_thumb", b_idx);
		 return res;
	 }
	 
	 public int decrease_thumb(int b_idx) {
		 int res = sqlSession.update("b.decrease_thumb", b_idx);
		 return res;
	 }
	 
	 public int getRowTotal() {
		 int res = sqlSession.selectOne("b.board_count");
		 return res;
	 }
	
}
