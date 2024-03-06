package com.shop.beauty.user;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {
	static final String VIEWPATH = "/WEB-INF/views";

	private final UserService userService;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(HttpServletRequest request) throws Exception {
		return VIEWPATH + "/login/login.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginreq(HttpServletRequest request, HttpServletResponse response, String email, String pwd,
			String yuji) throws Exception {
		HttpSession session = request.getSession();
		// Cookie sessionCookie = new Cookie("MYSESSIONID", "uniqueSessionID");

		int result = userService.login(session, email, pwd);
		if (result == 1) {
			if (yuji.equalsIgnoreCase("true")) {
				// 쿠키에 세션아이디 저장
				// response.addCookie(sessionCookie);
			}
			return "good";
		} else {
			return "bad";
		}
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus status)
			throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		Cookie cookie = new Cookie("useremail", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		status.setComplete();
		return VIEWPATH + "/main/main.jsp";
	}
}
