package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MyPageController {

	@Autowired
	UserDAO dao;

	static final String VIEW_PATH = "/WEB-INF/views/user/";

	@RequestMapping("/info")
	public String mypage() {
		log.info("mypage");
		return VIEW_PATH + "mypage.jsp";
	}

	@RequestMapping
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

}
