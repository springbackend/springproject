package controller;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.SearchService;
import util.HangulSearcher;
import vo.ProductVO;

@Controller
public class SearchController {

	SearchService s_service;
	static final String VIEW_PATH = "/WEB-INF/views/search/";

	public SearchController(SearchService s_service) {
		this.s_service = s_service;
	}

	@RequestMapping(value = "search_form.do", method = RequestMethod.GET)
	public String search_form() {
		return VIEW_PATH + "search.jsp";
	}

	@RequestMapping(value = "search_keyword.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String search_keyword(String keyword) {
		List<String> list = null;
		List<String> keyList = null;
		int[] che = null;
		String key = "";
		if (keyword != null && !keyword.isEmpty()) {
			if (!HangulSearcher.checkChosung(keyword.charAt(0))) {
				list = s_service.search_result(keyword);
			} else {
				list = s_service.search_keyword(keyword);
				if (list.size() == 0) {
					if(keyword.length() >1) {
					for (int i = 0; i < keyword.length()-1; i++) {
						key += keyword.charAt(i);
						if(key.length() == keyword.length()-1) {
						keyList = s_service.search_keyword(key);
						}
					}
					}else {
						char k = keyword.charAt(0);
						list = s_service.first_search_list(k);
					}
				}
			}
		}
		if (keyList != null) {
			che = HangulSearcher.getChosungJungsung(keyword);
			for (String keyCheck : keyList) {
				int[] keyListChosung = HangulSearcher.getChosungJungsung(keyCheck);
				if (che[0] == keyListChosung[0] && che[1] == keyListChosung[1]) {
					list.add(keyCheck);
				}
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = "";
		try {
			jsonString = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonString;
	}

	@RequestMapping(value = "/search_list.do", method = RequestMethod.GET)
	public String product_search_list(String keyword, String page, Model model) {
		int nowpage = 1;
		if (page != null && !page.isEmpty()) {
			nowpage = Integer.parseInt(page);
		}
		Map<String, Object> p_map = s_service.s_search_list(keyword, nowpage);
		model.addAttribute("list", p_map.get("list"));
		model.addAttribute("page_menu", p_map.get("page_menu"));
		return VIEW_PATH + "product_search.jsp";
	}
	}
