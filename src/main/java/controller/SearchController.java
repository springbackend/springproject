package controller;

import service.SearchService;

public class SearchController {
	
	SearchService s_service;
	
	public SearchController(SearchService s_service) {
		this.s_service = s_service;
	}

}
