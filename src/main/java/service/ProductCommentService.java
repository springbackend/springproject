package service;

import dao.ProductCommentDAO;

public class ProductCommentService {
	
	ProductCommentDAO pc_DAO;
	
	public ProductCommentService(ProductCommentDAO pc_DAO) {
		this.pc_DAO = pc_DAO;
	}

}
