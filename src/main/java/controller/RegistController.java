package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class RegistController {
//memo 
//vo 싱글톤

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	static final String VIEWPATH = "/WEB-INF/views";

	UserDAO userdao;

	public RegistController(UserDAO userdao) {
		this.userdao = userdao;
	}

	// 회원가입페이지 매핑
	@RequestMapping(value = "/regist.do")
	public String regist() {
		System.out.println("regist page");
		return VIEWPATH + "/login/regist.jsp";
	}

	// 회원가입 수행
	@RequestMapping(value = "/joinuser.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String joinuser(String id, String name, String pwd, String email, String gender, String pnum) {
//		String id, String name, String pwd, String email, String gender, String pnum
		// 넘어오는값 id name pwd pnum email gender pnum
		// uservo id name pwd pnum email gender pnum, idx,regidate, regiip, addr, birth
		// id name pwd pnum email gender pnum 매핑
		UserVO vo = new UserVO();
		String result = "실패";
		// 암호화
		if (id != null && pwd != null && name != null && gender != null && pnum != null) {
			vo.setId(id);
			vo.setPwd(pwd);
			vo.setName(name);
			vo.setGender(gender);
			vo.setPnum(pnum);
			vo.setEmail(email);
			System.out.println("set성공");
		} else {
			System.out.println("set실패");
			return String.valueOf(result);
		}
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		vo.setPwd(passwordEncoder.encode(vo.getPwd()));
		vo.setBirth("asd");
		vo.setAddr("asd");
		SimpleDateFormat rigidaytime = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		String regidate = rigidaytime.format(date);
		vo.setRegidate(regidate);
		vo.setRegiip(request.getRemoteAddr());
		// 회원가입 수행
		int res = userdao.save(vo);
		if (res > 0) {
			System.out.println("regist controller : regist 성공");
			result = "성공";
		} else {
			System.out.println("regist controller error : regist fail");
		}
		return String.valueOf(result);
	}
}