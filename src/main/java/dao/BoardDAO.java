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
	 
	 public int board_update(BoardVO vo) {
		 int res = sqlSession.update("b.board_update", vo);
		 return res;
	 }
	 
	 public int board_delete(int b_idx) {
		 int res = sqlSession.delete("b.board_delete", b_idx);
		 return res;
	 }
	 
	 public int update_comment(int b_idx) {
		 int res = sqlSession.update("b.update_comment", b_idx);
		 return res;
	 }
	 
	 public int update_readhit(int b_idx) {
		 int res = sqlSession.update("b.update_readhit", b_idx);
		 return res;
	 }
	 
	 public int like_increase(int b_idx) {
		 int res = sqlSession.update("b.like_increase", b_idx);
		 return res;
	 }
	 
	 public int like_decrease(int b_idx) {
		 int res = sqlSession.update("b.like_decrease", b_idx);
		 return res;
	 }
	 
	 public int getRowTotal() {
		 int res = sqlSession.selectOne("b.board_count");
		 return res;
	 }
	
}
