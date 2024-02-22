package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import vo.BoardVO;
import vo.UserVO;

@Slf4j
public class UserDAO {

	SqlSession sqlSession;

	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

// crud
	// create
	public int save(UserVO vo) {
		int res = sqlSession.insert("u.insert_user", vo);
		if (res > 0) {
			log.info("회원가입 성공 id : {}", vo.getU_id());
		} else {
			log.info("회원가입 실패 id : {}", vo.getU_id());
		}
		return res;
	}

	// read all
	public List<UserVO> findAll() {
		List<UserVO> list = sqlSession.selectList("u.select_list");
		return list;
	}

	// read one
	public UserVO findById(String id) {
		System.out.println(id);
		UserVO vo = sqlSession.selectOne("u.ismember", id);
		return vo;
	}

	// update password
	public int update(String pwd) {
		int res = sqlSession.update("u.insert", pwd);
		return res;
	}

	// delete
	public int delete(String id) {
		int res = sqlSession.delete("u.delete", id);
		if (res > 0) {
			log.info("계정삭제 완료", id);
		}
		return res;
	}

	public int changeMyPwd(UserVO uservo) {
		int res = sqlSession.update("u.changeMyPwd", uservo);
		return res;
	}

	// get idx
	public int select_idx(String id) {
		int idx = sqlSession.selectOne("u.select_idx", id);
		return idx;
	}

	public int deleteAccount(String id) {
		int res = sqlSession.delete("u.deleteAccount", id);
		return res;
	}

}