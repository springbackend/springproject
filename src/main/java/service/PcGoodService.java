package service;

import dao.PcGoodDAO;

public class PcGoodService {
	
	PcGoodDAO pcg_dao;
	
	public PcGoodService(PcGoodDAO pcg_dao) {
		this.pcg_dao = pcg_dao;
	}

}
