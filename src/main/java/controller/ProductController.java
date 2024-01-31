package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.ProductService;

@Controller
public class ProductController {
	ProductService p_service;
	
	public ProductController(ProductService p_service) {
		this.p_service = p_service;
	}
//	@RequestMapping("/product_category_list.do")
//	public String category_list(String page,String p_category,Model model) {
//		Map<String, Object> p_map = p_service.p_category_service(p_category, page);
//		model.addAttribute("list", p_map.get("list"));
//		model.addAttribute("page", p_map.get("page_menu"));
//		return "/WEB-INF/views/main/product_category.jsp";
//	}

}
