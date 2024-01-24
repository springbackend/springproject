package com.shop.beauty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;
import io.swagger.models.Model;
import vo.MemberVO;

@Controller
public class TempController {
	static final String VIEWPATH = "/WEB-INF/views";

	@Autowired
	MemberDAO dao;

//default page ���� 
	@RequestMapping(value = "/")
	public String temp() {

		return VIEWPATH + "/temp/temp.jsp";
	}

//�α���ȭ�� ����
	@RequestMapping(value = "/login.do")
	public String login(Model model) {
		MemberVO vo = dao.selectOne();
		String pwd = "";
		// �Ķ��� pwd ����		
		boolean test = false;

		if (vo != null) {
			if (vo.getPwd().equalsIgnoreCase(pwd)) {
				System.out.println("�α��μ���");
				test = true;
			} else {
				System.err.println("�α��ν��� ��й�ȣ ����ġ");
			}
			// login ����;
			// �α������� ������;
		} else {
			System.err.println("�α��� ���� ���̵� ����");
		}

		
		return VIEWPATH + "/login/login.jsp";
	}

//����ȭ�� ����
	@RequestMapping(value = "/regist.do")
	public String regist() {

		return VIEWPATH + "/login/regist.jsp";
	}
}