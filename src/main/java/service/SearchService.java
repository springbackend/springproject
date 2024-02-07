package service;

import java.util.ArrayList;
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
	
//	public List<ProductVO> search_keyword(String keyword){
//		Map<String, String> s_map = new HashMap<String, String>();
//		String[] result = HangulSearcher.search_filter(keyword);
//		s_map.put("one", result[0]);
//		s_map.put("two", result[1]);
//		List<ProductVO> list = s_dao.search_keyword(s_map);
//		return list;
//	}
	
	public List<String> search_result(String keyword){
		List<String> list = s_dao.search_ressult();
		List<String> resultList = new ArrayList<String>();
		String str = "";
		for(int i=0; i<list.size(); i++) {
			str = HangulSearcher.extractChosung(list.get(i));
			if(str.charAt(0) == keyword.charAt(0)) {
			int num =0;
			if(keyword.length() <= str.length()) {
			for(int j= 0; j<str.length(); j++) {
				String str2 = "";
				for(int c = num; c<keyword.length()+num; c++) {
					str2 += str.charAt(c);
				}//c
				if(keyword.equals(str2)) {
					resultList.add(list.get(i));
					break;
				}else {
					num++;
				}
				
				if(str2.length() == str.length()|| str2.length()+num == str.length()+1) {
					break;
				}
			}//j
			}
			}
		}//i
		System.out.println(resultList);
		return resultList;
	}
	

}
