package service;

import org.apache.ibatis.session.SqlSession;

import dao.PcGoodDAO;
import vo.PcGoodVO;

public class PcGoodService {
	
	PcGoodDAO pcg_dao;
	
	public PcGoodService(PcGoodDAO pcg_dao) {
		this.pcg_dao = pcg_dao;
	}
	
	public int pcg_click(PcGoodVO pcg_vo) {
		int res = pcg_dao.good_Click(pcg_vo);
		return res;
	}

}
