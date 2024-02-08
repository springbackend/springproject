package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class SearchDAO {
	
	SqlSession sqlSession;
	
	public SearchDAO(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public List<ProductVO> search_keyword(Map<String, String> s_map) {
		List<ProductVO> list = sqlSession.selectList("s.search_p_name",s_map);
		return list;
	}
	
	public List<ProductVO> search_keyword2(String keyword) {
		List<ProductVO> list = sqlSession.selectList("s.search_p_namet",keyword);
		return list;
	}
	
	public List<String> search_ressult(){
		List<String> list = sqlSession.selectList("s.search_result");
		return list;
	}
	


}
