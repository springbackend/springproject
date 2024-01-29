package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class RegistController {

	static final String VIEWPATH = "/WEB-INF/views";

	UserDAO dao;
	UserVO vo;

	// 회원가입페이지 매핑
	@RequestMapping(value = "/regist.do")
	public String regist() {
		System.out.println("regist page");
		return VIEWPATH + "/login/regist.jsp";
	}

	// 회원가입 수행
	@RequestMapping(value = "/joinuser.do", method = RequestMethod.POST)
	@ResponseBody
	public String registreq(HttpServletRequest request, Model model) {

		// 전화번호 추가해야함
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");

		// 회원가입 수행
		int res = dao.insert(vo);
		if (res > 0) {
			System.out.println("regist controller : regist 성공");
		} else {
			System.out.println("regist controller error : regist fail");
		}
		return "성공";
	}
}
