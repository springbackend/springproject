package dao;

import org.apache.ibatis.session.SqlSession;

public class ProductCommentDAO {
	
	SqlSession sqlSession;
	
	public ProductCommentDAO(SqlSession sqlSession) {
		this.sqlSession =sqlSession;
	}
	

}
