package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductDAO;
import vo.ProductVO;

public class ProductService {
	
	ProductDAO p_dao;
	
	public void setP_dao(ProductDAO p_dao) {
		this.p_dao = p_dao;
	}
	
	public List<ProductVO> p_category_service(String p_category){
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("p_category", p_category);
		
		List<ProductVO> list = p_dao.p_category_select(p_map);
		return list;
	}

}
