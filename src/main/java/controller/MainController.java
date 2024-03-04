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

	@RequestMapping(value = "/main.do")
	public String main1(Model model) {
		List<ProductVO> list = p_service.p_best_main();
		model.addAttribute("list",list);
		return VIEW_PATH + "/main.jsp";
	}

}
