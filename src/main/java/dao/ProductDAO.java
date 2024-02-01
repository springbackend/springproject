package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {
	
	SqlSession sqlSession;
	
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ProductVO> p_category_select(Map<String, Object> p_map){
		List<ProductVO> list = sqlSession.selectList("p.select_category", p_map);
		return list;
	}
	
	public int p_category_count(String p_category) {
		int count = sqlSession.selectOne("p.select_category_count", p_category);
		return count;
	}
	
	public ProductVO p_view(int p_idx) {
		ProductVO p_vo = sqlSession.selectOne("p.select_product_view", p_idx);
		return p_vo;
	}

}
