package controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.base.Optional;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class LoginController {
	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		System.out.println("login page");

		return VIEWPATH + "/login/login.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody()
	public String loginreq(String id, String pwd) {
		// 로그인 기능구현
		String res = "";
//		UserVO vo = dao.findbyId(id);
//		if (vo != null) {
//		} else {
//			System.err.println("controller error : vo 반환값이 없습니다");
//		}
		return String.valueOf(res);
	}
}
