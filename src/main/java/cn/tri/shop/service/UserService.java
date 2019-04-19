package cn.tri.shop.service;

import cn.tri.shop.pojo.User;

public interface UserService {
	public void addUser(User user);
	public User loginUser(User user);
	public void activeUser(User user);
	public int checkActive(User user);
}
