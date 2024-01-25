package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// top head

@Controller
public class TempController {
	static final String VIEWPATH = "/WEB-INF/views";

	@RequestMapping(value = "/")
	public String temp() {
		return VIEWPATH + "/temp/temp.jsp";
	}

	@RequestMapping(value = "/top")
	public String temptop() {
		return VIEWPATH + "/temp/top.jsp";
	}

	@RequestMapping(value = "/head")
	public String temphead() {
		return VIEWPATH + "/temp/head.jsp";
	}
}
