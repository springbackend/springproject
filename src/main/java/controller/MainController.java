package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	static final String VIEW_PATH = "/WEB-INF/views/main/";

	@RequestMapping(value = "/main.do")
	public String main1() {
		return VIEW_PATH + "/main.jsp";
	}

}
