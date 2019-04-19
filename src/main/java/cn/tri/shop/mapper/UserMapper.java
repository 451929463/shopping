package cn.tri.shop.mapper;

import cn.tri.shop.pojo.User;

public interface UserMapper {
	public void addUser(User user);
	public User loginUser(User user);
	public void activeUser(User user);
	public int checkActive(User user);
}
