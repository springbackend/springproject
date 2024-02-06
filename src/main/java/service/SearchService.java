package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.SearchDAO;
import util.HangulSearcher;
import vo.ProductVO;

public class SearchService {
	
	SearchDAO s_dao;
	
	public SearchService(SearchDAO s_dao){
		this.s_dao = s_dao;
	}
	
	public List<ProductVO> search_keyword(String keyword){
		Map<String, String> s_map = new HashMap<String, String>();
		String[] result = HangulSearcher.search_filter(keyword);
		s_map.put("one", result[0]);
		s_map.put("two", result[1]);
		List<ProductVO> list = s_dao.search_keyword(s_map);
		return list;
	}
	
	public List<ProductVO> search_keyword2(String keyword){
		List<ProductVO> list = s_dao.search_keyword2(keyword);
		return list;
	}
}
