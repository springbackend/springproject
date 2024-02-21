package dao;

import org.apache.ibatis.session.SqlSession;

public class PcGoodDAO {
	
	SqlSession sqlSession;
	
	public PcGoodDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
