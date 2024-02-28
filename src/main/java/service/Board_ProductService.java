package service;

import dao.Board_ProductDAO;

public class Board_ProductService {

	Board_ProductDAO p_dao;
	
	public Board_ProductService(Board_ProductDAO p_dao) {
		this.p_dao = p_dao;
	}
	
	public String select_product_name(int p_idx) {
		System.out.println("in bp service");
		String p_name = p_dao.select_product_name(p_idx);
		return p_name;
	}
}
