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
		} else {
			Optional<UserVO> option = Optional.ofNullable(dao.ismember(id));
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			if (option.isEmpty()) {
				return result;
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

	@RequestMapping(value = "/findid.do")
	public String findid() {

		return VIEWPATH + "/login/findid.jsp";
	}

	@RequestMapping(value = "/findpw.do")
	public String findpwd() {

		return VIEWPATH + "/login/findpw.jsp";
	}

	@RequestMapping(value = "/checkid.do")
	public String checkid(String user_id) {
		//user_id 있는지확인
		//없을시에 response로 cancreate 요청을 함께 전달
		
		return VIEWPATH + "/login/checkid.jsp";
	}

	@ResponseBody
	@RequestMapping("/searchemail.do")
	public String findByEmail() {
		// 이메일로 아이디를 찾는 요청

		// db 에서 해당이메일조회
		// 이메일에 해당하는 아이디 값 받기
		// 아이디의 뒷 2자리를 **표시
		// 해당값 json 형태로 반환

		return "fail";
	}

	@ResponseBody
	@RequestMapping("/searchid.do")
	public String findById() {
		// 아이디로 비밀번호를 재설정하는 요청

		// db 에서 해당 id조회
		// 아이디에 일치하는 이메일 조회

		// 아이디로 이메일 조회

		// 해당 이메일로 재설정 URL 보내기(동적 링크...)

		// 이메일의 뒤 2글자에 **표시 붙여서 return함

		return "fail";
	}

}
