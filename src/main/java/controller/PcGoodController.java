package controller;

import org.springframework.stereotype.Controller;

import service.PcGoodService;

@Controller
public class PcGoodController {
	
	PcGoodService pcg_service;
	
	public PcGoodController(PcGoodService pcg_service) {
		this.pcg_service = pcg_service;
	}
	
	

}
