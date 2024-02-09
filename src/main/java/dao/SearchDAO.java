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
	
	public List<String> search_keyword(String keyword) {
		List<String> list = sqlSession.selectList("s.search_p_namet",keyword);
		return list;
	}
	
	public List<String> search_result(){
		List<String> list = sqlSession.selectList("s.search_result");
		return list;
	}
	


}
