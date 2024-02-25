package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int productComment_write(ProductCommentVO pc_vo,String id) {
		int u_idx = pc_dao.user_select(id);
		pc_vo.setU_idx(u_idx);
		int res = pc_dao.productComment_write(pc_vo);
		return res;
	}
	
	public int productComment_good_count(int pc_idx) {
		int count = pc_dao.pc_good_update(pc_idx);
		return count;
	}
	
	public int productComment_good_minus(int pc_idx) {
		int minus = pc_dao.pc_good_minus(pc_idx);
		return minus;
	}
	
	public int productComment_delete(String u_id,int pc_idx) {
		int u_idx = pc_dao.user_select(u_id);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("u_idx", u_idx);
		map.put("pc_idx", pc_idx);
		int res = pc_dao.productComment_delete(map);
		return res;
	}

}
