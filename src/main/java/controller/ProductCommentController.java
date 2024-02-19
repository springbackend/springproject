package controller;

import org.springframework.stereotype.Controller;

import service.ProductCommentService;

@Controller
public class ProductCommentController {
	ProductCommentService pc_Service;
	
	public ProductCommentController(ProductCommentService pc_Service) {
		this.pc_Service = pc_Service;
	}

}
