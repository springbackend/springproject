package com.shop.beauty.user;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import vo.UserVO;

@Slf4j
@RequiredArgsConstructor
public class UserDAO {

	private final SqlSession sqlSession;

	// create
	public int createUserByUservo(UserVO vo) {

		int res = sqlSession.insert("u.join", vo);
		return res;
	}

	// read all
	public List<UserVO> findUserAll() {
		return sqlSession.selectList("u.select_list");
	}

	public UserVO findUserByEmail(String u_email) {
		return sqlSession.selectOne("u.findUserByEmail", u_email);
	}

	// update password
	public int updatePwdByEmail(UserVO vo) {
		return sqlSession.update("u.insert", vo);
	}

	// delete
	public int deleteUserByEmail(String u_email) {
		int res = sqlSession.delete("u.delete", u_email);
		if (res > 0) {
			log.info("계정삭제 완료", u_email);
		}
		return res;
	}

	public int updatePwdByUservo(UserVO uservo) {
		return sqlSession.update("u.changeMyPwd", uservo);
	}

	public int findIdxByEmail(String u_email) {
		return sqlSession.selectOne("u.select_idx", u_email);
	}

	public int findIdByEmail(String u_email) {
		return sqlSession.selectOne("u.select_idx", u_email);
	}

}