package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductCommentVO;

public class ProductCommentDAO {
	
	SqlSession sqlSession;
	
	public ProductCommentDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	
	public List<ProductCommentVO> productComment_list(int p_idx){
		List<ProductCommentVO> list = sqlSession.selectList("pc.product_comment",p_idx);
		return list;
	}
	
	public int productComment_write(ProductCommentVO pc_vo) {
		int res = sqlSession.insert("pc.product_comment_write", pc_vo);
		return res;
	}
	

}
