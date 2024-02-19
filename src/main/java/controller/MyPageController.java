package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserBoardDAO;
import dao.UserDAO;
import lombok.extern.slf4j.Slf4j;
import vo.BoardVO;
import vo.UserVO;

@Slf4j
@Controller
public class MyPageController {

	UserDAO userdao;
	UserBoardDAO userBoardDAO;

	public MyPageController(UserDAO userdao, UserBoardDAO userBoardDAO) {
		this.userdao = userdao;
		this.userBoardDAO = userBoardDAO;
	}

	static final String VIEW_PATH = "/WEB-INF/views/user/";

	@RequestMapping(value = "/myInfo.do")
	public String myInfo() {
		return VIEW_PATH + "/user/myInfo.jsp";
	}

	// 내글보기
	@ResponseBody
	@RequestMapping(value = "/viewMyPosts.do")
	public List<BoardVO> viewMyPosts(HttpSession session) {
		String id = session.getId();
		// 내글조회
		List<BoardVO> list = userBoardDAO.viewMyPosts(id);
		return list;
	}

	// 내가 작성한 댓글보기
	@ResponseBody
	@RequestMapping(value = "/viewMyComments.do")
	public List<BoardVO> viewMyComments(HttpSession session) {
		String id = session.getId();
		// 내댓글조회
		List<BoardVO> list = userBoardDAO.viewMyComments(id);
		return list;
	}

	// 비밀번호 변경하기
	@ResponseBody
	@RequestMapping(value = "/changeMyPwd.do")
	public String changeMyPwd(HttpSession session, String pwd) {
		String result = "fail";
		String id = session.getId();
		UserVO uservo = new UserVO();
		uservo.setId(id);
		uservo.setPwd(pwd);
		// 비밀번호 변경
		int res = userdao.changeMyPwd(uservo);
		if (res > 0) {
			result = "success";
		}
		return result;
	}

	// 계정삭제
	@ResponseBody
	@RequestMapping(value = "/deleteAccount.do")
	public String deleteAccount(HttpSession session) {
		String result = "fail";
		String id = session.getId();
		// 비밀번호 변경
		int res = userdao.deleteAccount(id);
		if (res > 0) {
			result = "success";
		}
		return result;
	}

}
