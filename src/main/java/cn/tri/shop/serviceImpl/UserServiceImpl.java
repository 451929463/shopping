package cn.tri.shop.serviceImpl;

import cn.tri.shop.mapper.UserMapper;
import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;

public class UserServiceImpl implements UserService{
	private UserMapper userMapper ;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}


	@Override
	public void addUser(User user) {
		userMapper.addUser(user);
	}

}
