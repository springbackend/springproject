package service;

import dao.SearchDAO;

public class SearchService {
	
	SearchDAO s_dao;
	
	public SearchService(SearchDAO s_dao){
		this.s_dao = s_dao;
	}

}
