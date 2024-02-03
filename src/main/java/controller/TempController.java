package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/* html 컴포넌트와 페이지등을 바로갈수있도록 만든 임시 페이지
 * 
 * 
 * 
 * 
*/
@Controller
public class TempController {

	static final String VIEWPATH = "/WEB-INF/views";

//컴포넌트 ===================================================
	@RequestMapping(value = "/")
	public String main() {
		return "redirect:/temp.do";
	}

	@RequestMapping(value = { "/temp.do" })
	public String temp() {
		return VIEWPATH + "/temp/temp.jsp";
	}

	// 컴포넌트 지역
	@RequestMapping(value = "/top.do")
	public String temptop() {
		return VIEWPATH + "/temp/top.jsp";
	}

	@RequestMapping(value = "/header.do")
	public String temphead() {
		return VIEWPATH + "/temp/header.jsp";
	}

	@RequestMapping(value = "/index.do")
	public String goindex() {
		return VIEWPATH + "/main/index.jsp";
	}

	@RequestMapping(value = "/footer.do")
	public String gofooter() {
		return VIEWPATH + "/temp/footer.jsp";
	}

//페이지 (필요하면 제거후 옮길것)======================================================

}
