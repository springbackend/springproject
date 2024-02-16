package controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import vo.BoardVO;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MyPageController {

	@Autowired
	UserDAO dao;

	@Autowired
	SqlSession sqlSession;

	static final String VIEW_PATH = "/WEB-INF/views/user/";

	@RequestMapping("/info")
	public String mypage() {
		log.info("mypage");
		return VIEW_PATH + "mypage.jsp";
	}

	@RequestMapping("/deleteaccount.do") // RequestMapping이 비어있어서 자꾸오류떠서 아무값이나 넣음
	@ResponseBody
	public String deleteAccount(String id) {
		String result = "fail";
		int res = dao.delete(id);
		if (res > 0) {
			log.info("delete account success id = {}", id);
			result = "success";

		} else {
			log.info("delete account error id = {}", id);
		}
		return result;
	}

	@RequestMapping("/findmycomment")
	@ResponseBody
	public Model findmycomment(Model model, String id) {
		List<BoardVO> list = dao.findMyComment(id);
		model.addAttribute(list);
		return model;
	}

	@RequestMapping("/findmylist")
	@ResponseBody
	public Model findmylist(Model model, String id) {
		List<BoardVO> list = dao.findMyList(id);
		model.addAttribute(list);
		return model;
	}

}
