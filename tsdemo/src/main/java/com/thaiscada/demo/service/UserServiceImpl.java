package com.thaiscada.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thaiscada.demo.dao.UserDao;
import com.thaiscada.demo.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public void addUser(User user) {
		userDao.addUser(user);
	}

	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	public User getUser(int id) {
		return userDao.getUser(id);
	}

	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}

	public List<User> getUsers() {
		return userDao.getUsers();
	}

}
