package dao;

import java.util.Map;

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
	
	public int good_user(String u_id) {
		int u_idx = sqlSession.selectOne("pcg.pc_u_id",u_id);
		return u_idx;
	}
	
//	public int user_check(String u_id) {
//		int check =0;
//		check=sqlSession.selectOne("pcg.pc_u_id_check",u_id);
//		System.out.println(check);
//		return check;
//	}
	
	public PcGoodVO user_check(Map<String, Integer> map) {
		PcGoodVO pcg_vo = sqlSession.selectOne("pcg.pc_u_id_check",map);
		return pcg_vo;
	}
	
	public int delete_pcg(int u_idx) {
		int del = sqlSession.delete("pcg.pcg_delete",u_idx);
		return del;
	}
	

}
