package com.shop.beauty.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import vo.UserVO;

@Controller
@RequiredArgsConstructor
public class RegistController {

	private final HttpServletRequest request;
	private final HttpSession session;
	private final UserDAO userdao;
	private final UserService userService;

	static final String VIEWPATH = "/WEB-INF/views";

	// 회원가입페이지 매핑
	@RequestMapping(value = "/regist.do")
	public String regist() {
		return VIEWPATH + "/login/regist.jsp";
	}

	// 회원가입 수행
	@ResponseBody
	@RequestMapping(value = "/join.do", produces = "text/plain;charset=UTF-8")
	public String joinuser(String email, String name, String pwd) {
		UserVO vo = new UserVO();
		String result = "실패";
		int result = userService.join(email, name, pwd, request.getRemoteAddr());

		if (result > 0) {
			System.out.println("regist controller : regist 성공");
			return "성공";
		} else {
			System.out.println("regist controller error : regist fail");
			return "실패";
		}
	}

	@RequestMapping(value = "/checkid.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String checkid(String id) {
		Optional<UserVO> _uservo = userdao.findIdByEmail(id);
		if (_uservo.isEmpty()) {
			return "can";
		} else {
			UserVO vo = option.get();
			System.out.println(vo.toString());
			return "cant";
		}
	}

}