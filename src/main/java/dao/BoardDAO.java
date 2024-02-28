package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 
	 public List<BoardVO> board_order_by(Map<String, Object> order_map){
		 System.out.println("in DAO: " + order_map.get("order_by"));
		 Object zero = (int)0;
		 List<BoardVO> list;
		 if(order_map.get("t_idx") == zero && order_map.get("p_idx") == zero) {
			 //t_idx와 p_idx 둘 다 없는 경우
			 String order = (String)order_map.get("order_by");
			 list = sqlSession.selectList("b.board_order_by_only", "readhit");
		 }else if(order_map.get("t_idx") == zero && order_map.get("p_idx") != zero) {
			 //t_idx만 없는 경우
			 list = sqlSession.selectList("b.board_order_by_product", order_map);
		 }else if(order_map.get("t_idx") != zero && order_map.get("p_idx") == zero) {
			 //p_idx만 없는 경우
			 list = sqlSession.selectList("b.board_order_by_tone", order_map);
		 }else {
			 //다 있는 경우
			 list = sqlSession.selectList("b.board_order_by", order_map);
		 }
		 
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
