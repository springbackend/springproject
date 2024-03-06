package com.shop.beauty.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vo.UserVO;

@Service
@RequiredArgsConstructor
public class UserService {

	private final UserDAO userdao;
	UserVO uservo;

	public int select_idx(String email) {
		int idx = userdao.findIdxByEmail(email);
		return idx;
	}

	public int login(HttpSession session, String email, String pwd) {
		Optional<UserVO> _uservo = Optional.ofNullable(userdao.findUserByEmail(email));
		if (_uservo.isPresent()) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			uservo = _uservo.get();
			if (passwordEncoder.matches(pwd, uservo.getU_pwd())) {
				session.setAttribute("status", "succes");
				session.setAttribute("nickname", uservo.getU_name());
				session.setAttribute("email", uservo.getU_email());
				// 로그인성공
				return 1;
			}
			// 비밀번호 틀림
			return 0;
		}
		// 계정조회 실패
		return 0;
	}

	public int join(String email, String name, String pwd, String ip) {
		uservo.setU_regidate(getCurrentTime());
		uservo.setU_regiip(ip);
		uservo.setU_name(name);
		uservo.setU_email(email);
		uservo.setU_pwd(lockpwd(pwd));
		int result = userdao.createUserByUservo(uservo);
		if (result == 1) {
			return 1;
		}
		return 0;
	}

	private String lockpwd(String pwd) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		return passwordEncoder.encode(pwd);
	}

	private String getCurrentTime() {
		SimpleDateFormat rigidaytime = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());
		return rigidaytime.format(date);
	}

}
