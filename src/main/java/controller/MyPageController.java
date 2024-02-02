package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	static final String VIEW_PATH = "/WEB-INF/views/login/";

	@RequestMapping(value = "mypage.do")
	public String mypage() {
		return VIEW_PATH + "mypage.jsp";
	}

}
