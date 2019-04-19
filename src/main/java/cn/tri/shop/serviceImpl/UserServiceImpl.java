package cn.tri.shop.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tri.shop.mapper.UserMapper;
import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper ;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}


	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}


	@Override
	public User loginUser(User user) {
		User u = userMapper.loginUser(user);
		return u;
	}


	@Override
	public void activeUser(User user) {
		userMapper.activeUser(user);
	}


	@Override
	public int checkActive(User user) {
		return userMapper.checkActive(user);
	}

}
