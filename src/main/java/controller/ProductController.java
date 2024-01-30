package controller;

import org.springframework.stereotype.Controller;

import service.ProductService;

@Controller
public class ProductController {
	ProductService p_service;
	
	public void setP_service(ProductService p_service) {
		this.p_service = p_service;
	}

}
