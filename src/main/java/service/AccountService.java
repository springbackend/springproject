package service;

import org.springframework.stereotype.Service;

@Service
public interface AccountService {

	void creatAccount();

	void lockPassword();

	void deleteAccount();

	void login();

	void logout();

	void updateAddres();

	void updateGender();

	void updateBirthday();

	void updatePhoneNumber();

}
