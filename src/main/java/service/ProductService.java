package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.ProductDAO;
import util.Common;
import util.ProductPaging;
import vo.ProductVO;

public class ProductService {
	
	ProductDAO p_dao;
	
	public ProductService(ProductDAO p_dao) {
		this.p_dao = p_dao;
	}
	
	public Map<String, Object> p_category_service(String p_category,int nowpage){
		int start = (nowpage-1) * Common.Product.BLOCKLIST + 1;
		int end = start+Common.Product.BLOCKLIST-1;
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("p_category", p_category);
		p_map.put("start", start);
		p_map.put("end", end);
		List<ProductVO> list = p_dao.p_category_select(p_map);
		int rowtotal = p_dao.p_category_count(p_category);
		p_map.put("list", list);
		
		String page_menu = ProductPaging.getPaging("product_category_list.do", nowpage, rowtotal, Common.Product.BLOCKLIST,
				Common.Product.BLOCKPAGE,p_category);
		
		p_map.put("page_menu", page_menu);
		return p_map;
	}
	
	public ProductVO p_product_view(int p_idx) {
		ProductVO p_vo = p_dao.p_view(p_idx);
		return p_vo;
	}
	
	public int p_buy(int p_idx,int quantity) {
		Map<String, Integer> p_map = new HashMap<String, Integer>();
		p_map.put("p_idx", p_idx);
		p_map.put("quantity", quantity);
		int res = p_dao.p_buy(p_map);
		return res;
	}
	
	public ProductVO p_buy_view(int p_idx) {
		ProductVO p_vo = p_dao.p_buy_view(p_idx);
		return p_vo;
	}
	
	
	

}
