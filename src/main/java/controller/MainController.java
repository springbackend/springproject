package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductService;
import vo.ProductVO;

@Controller
public class MainController {
	static final String VIEW_PATH = "/WEB-INF/views/main/";
	
	@Autowired
	private ProductService p_service;

	@Autowired
	private HttpSession session;
	public String main1(Model model) {
		int user = 0;
		if(session.getAttribute("email") != null) {
			user = 1;
		}
		model.addAttribute("user", user);
		return VIEW_PATH + "/main.jsp";
	}

}
