package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.SearchDAO;
import util.Common;
import util.HangulSearcher;
import util.ProductPaging;
import vo.ProductVO;

public class SearchService {
	
	SearchDAO s_dao;
	
	public SearchService(SearchDAO s_dao){
		this.s_dao = s_dao;
	}
	
	public List<String> search_result(String keyword){
		List<String> list = s_dao.search_result();
		List<String> resultList = new ArrayList<String>();
		String str = "";
		for(int i=0; i<list.size(); i++) {
			str = HangulSearcher.resultChosung(list.get(i));
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
		return resultList;
	}
	public List<String> search_keyword(String keyword){
		List<String> list = s_dao.search_keyword(keyword);
		return list;
	}
	
	public Map<String , Object> s_search_list(String keyword,int nowpage){
		int start = (nowpage-1) * Common.Product.BLOCKLIST +1;
		int end = start + Common.Product.BLOCKLIST-1;
		Map<String, Object> p_map = new HashMap<String, Object>();
		p_map.put("keyword", keyword);
		p_map.put("start", start);
		p_map.put("end", end);
		List<ProductVO> list = s_dao.s_search_list(p_map);
		int rowtotal = s_dao.s_search_count(keyword);
		p_map.put("list", list);
		String page_menu = ProductPaging.getSearchPaging("search_list.do", nowpage, rowtotal, Common.Product.BLOCKLIST, Common.Product.BLOCKPAGE, keyword);
		p_map.put("page_menu", page_menu);
		return p_map;
	}
	
	public List<String> first_search_list(char k){
		List<String> list = s_dao.search_result();
		List<String> firstlist = new ArrayList<String>();
		
		for(int i= 0 ; i<list.size(); i++) {
			if(HangulSearcher.composeHangul(list.get(i)).charAt(0) == k) {
				firstlist.add(list.get(i));
			}
		}
		return firstlist;
	}

}
