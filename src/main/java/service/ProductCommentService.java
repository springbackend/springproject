package service;

import java.util.List;

import dao.ProductCommentDAO;
import vo.ProductCommentVO;

public class ProductCommentService {
	
	ProductCommentDAO pc_dao;
	
	public ProductCommentService(ProductCommentDAO pc_dao) {
		this.pc_dao = pc_dao;
	}
	
	public List<ProductCommentVO> productComment_list(int p_idx){
		List<ProductCommentVO> list = pc_dao.productComment_list(p_idx);
		return list;
	}
	
	public int productComment_write(ProductCommentVO pc_vo) {
		int res = pc_dao.productComment_write(pc_vo);
		return res;
	}

}
