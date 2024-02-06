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
import lombok.extern.slf4j.Slf4j;
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

	@RequestMapping(value = "/login.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String loginreq(HttpServletRequest request, String id, String pwd, String yuji) {
		HttpSession session = request.getSession();

		if (yuji.equalsIgnoreCase(yuji)) {
			session.setMaxInactiveInterval(-1);
		}
		/*
		 */
		String result = "濡쒓렇�씤 �떎�뙣";
		String good = "濡쒓렇�씤 �꽦怨�";
		if (id.equalsIgnoreCase("1111") && pwd.equalsIgnoreCase("1111")) {
			result = good;
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", "�엫�떆�븘�씠�뵒");
			System.out.println(session.getAttribute("nickname"));
			// session.getAttribute("status");
		} else {
			// 濡쒓렇�씤 湲곕뒫援ы쁽
			Optional<UserVO> option = Optional.ofNullable(dao.ismember(id));
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (option.isEmpty()) {
				return result;
//				濡쒓렇�씤 �떎�뙣
			} else {
				UserVO vo = option.get();
				if (!passwordEncoder.matches(pwd, vo.getPwd())) {
					return result;
				}
			}
			result = good;
			UserVO vo = option.get();
			// �꽭�뀡 援ы쁽
			session.setAttribute("status", "succes");
			session.setAttribute("nickname", vo.getName());
		}
		return result;
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return VIEWPATH + "/main/main.jsp";
	}

}
