package com.shop.beauty;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TempController {
	static final String VIEWPATH = "/WEB-INF/views";


//default page 매핑 
	@RequestMapping(value = "/")
	public String temp() {

		return VIEWPATH + "/temp/temp.jsp";
	}

//로그인화면 매핑
	@RequestMapping(value = "/login.do")
	public String login() {
//		MemberVO vo = dao.selectOne();
//		String pwd = "";
//		// 파람의 pwd 대입		
//		boolean test = false;
//
//		if (vo != null) {
//			if (vo.getPwd().equalsIgnoreCase(pwd)) {
//				System.out.println("로그인성공");
//				test = true;
//			} else {
//				System.err.println("로그인실패 비밀번호 불일치");
//			}
//			// login 성공;
//			// 로그인정보 보내기;
//		} else {
//			System.err.println("로그인 실패 아이디 없음");
//		}
//
//		
		return VIEWPATH + "/login/login.jsp";
	}

//가입화면 매핑
	@RequestMapping(value = "/regist.do")
	public String regist() {

		return VIEWPATH + "/login/regist.jsp";
	}
}
