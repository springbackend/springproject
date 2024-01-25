package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		return VIEWPATH + "/login/login.jsp";
	}

	// 회원가입페이지 매핑
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {
		return VIEWPATH + "/login/regist.jsp";
	}

	// 회원가입 수행
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String registreq() {
		// 회원가입 수행
		boolean succes;
		
		
		return VIEWPATH + "/login/regist.jsp";
	}
}
