package service;

import dao.RegistDao;
import domain.User;
import utils.MD5Utils;

public class RegistService {

	public boolean regist(User user) {
		user.setPassword(MD5Utils.md5(user.getPassword()));
		RegistDao dao = new RegistDao();
		return dao.regist(user);
	}

	public boolean active(String code) {
		RegistDao dao = new RegistDao();
		return dao.active(code);
	}

	public boolean checkUsername(String username) {
		RegistDao dao = new RegistDao();
		return dao.checkUsername(username);
	}

	public User login(User user, boolean isAutoLogin) {
		RegistDao dao = new RegistDao();

		if (!isAutoLogin) {
			user.setPassword(MD5Utils.md5(user.getPassword()));
		}
		return dao.login(user);
	}

}
