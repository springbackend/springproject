package dao;

import org.apache.ibatis.session.SqlSession;

import vo.PcGoodVO;

public class PcGoodDAO {
	
	SqlSession sqlSession;
	
	public PcGoodDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int good_Click(PcGoodVO pcg_vo) {
		int res = sqlSession.insert("pcg.pc_good", pcg_vo);
		return res;
	}
	

}
