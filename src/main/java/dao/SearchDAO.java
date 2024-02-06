package dao;

import org.apache.ibatis.session.SqlSession;

public class SearchDAO {
	
	SqlSession sqlSession;
	
	public SearchDAO(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}

}
