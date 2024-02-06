package controller;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.SearchService;
import vo.ProductVO;

@Controller
public class SearchController {
	
	SearchService s_service;
	static final String VIEW_PATH = "/WEB-INF/views/search/";
	public SearchController(SearchService s_service) {
		this.s_service = s_service;
	}
	@RequestMapping(value = "search_form.do" , method = RequestMethod.GET)
	public String search_form() {
		return VIEW_PATH+"search.jsp";
	}
	@RequestMapping(value= "search_keyword.do",method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String search_keyword(String keyword) {
		List<ProductVO> list = s_service.search_keyword(keyword);
		 ObjectMapper mapper = new ObjectMapper();
		    String jsonString = "";
		    try {
		        jsonString = mapper.writeValueAsString(list);
		    } catch (Exception e) {
		        e.printStackTrace();
		        // 오류 처리, 필요한 경우 오류 메시지를 JSON으로 변환하여 반환
		        jsonString = "{\"error\":\"Error converting list to JSON\"}";
		    }
		    return jsonString;
	}
}
