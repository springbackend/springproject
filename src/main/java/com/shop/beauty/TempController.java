package com.shop.beauty;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TempController {
	static final String VIEWPATH = "/WEB-INF/views";

//default page ���� 
	@RequestMapping(value = "/")
	public String temp() {

		return VIEWPATH + "/temp/temp.jsp";
	}

//�α���ȭ�� ����
	@RequestMapping(value = "/login.do")
	public String login() {

		return VIEWPATH + "/login/login.jsp";
	}

	
//����ȭ�� ����
	@RequestMapping(value = "/regist.do")
	public String regist() {

		return VIEWPATH + "/login/regist.jsp";
	}
}
