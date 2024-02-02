package controller;

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
	public String loginreq(HttpServletRequest request, String id, String pwd, String yuji) {
		HttpSession session = request.getSession();
//		로그인 유지하기 시 세션 무한으로 설정했으나 세션은 브라우저 종료시 날라감, jwt를 사용한 쿠키를 적용해야 유지가능 

		if (yuji.equalsIgnoreCase(yuji)) {
			session.setMaxInactiveInterval(-1);
		}
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
			System.out.println(session.getAttribute("nickname"));
			// session.getAttribute("status");
		} else {
			// 로그인 기능구현
			Optional<UserVO> option = Optional.ofNullable(dao.ismember(id));
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (option.isEmpty()) {
				return result;
//				로그인 실패
			} else {
				UserVO vo = option.get();
				if (!passwordEncoder.matches(pwd, vo.getPwd())) {
					return result;
//				로그인 실패
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
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return VIEWPATH + "/main/main.jsp";
	}
}
