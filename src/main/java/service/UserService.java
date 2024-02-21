package service;

import org.springframework.stereotype.Service;

import dao.UserDAO;

@Service
public class UserService {

	UserDAO user_dao;
	
	public UserService(UserDAO user_dao) {
		this.user_dao = user_dao;
	}
	
	public int select_idx(String id) {
		int idx = user_dao.select_idx(id);
		return idx;
	}
	
}
