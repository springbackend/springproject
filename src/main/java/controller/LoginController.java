package controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class LoginController {
	static final String VIEWPATH = "/WEB-INF/views";

	@Autowired
	UserDAO dao;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		System.out.println("login page");
		return VIEWPATH + "/login/login.jsp";
	}

	@RequestMapping(value = "/login.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginreq(HttpServletRequest request, String id, String pwd) {
		HttpSession session = request.getSession();
		session.setAttribute("status", "fail");
		/*
		 * 세션 무한존재 session.setMaxInactiveInterval(-1); 세션값 삭제 session.removeAttribute();
		 * 세션 전체제거 session.invalidate();
		 */
		String result = "로그인 실패";
		String good = "로그인 성공";
		if (id.equalsIgnoreCase("1111") && pwd.equalsIgnoreCase("1111")) {
			result = good;
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", "임시아이디");
			//session.getAttribute("status");
		} else {
			// 로그인 기능구현
			Optional<UserVO> option = Optional.ofNullable(dao.ismember(id));
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (option.isEmpty()) {
				System.out.println("아이디가 없다링");
				return result;
			} else {
				UserVO vo = option.get();
				if (!passwordEncoder.matches(pwd, vo.getPwd())) {
					System.out.println("로그인실패");
					return result;
				}
			}
			result = good;
			UserVO vo = option.get();
			// 세션 구현
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", vo.getName());
		}
		return result;
	}
	@RequestMapping(value = "/logout.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "로그아웃 완료";
	}
}
