package cn.tri.shop.servlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;
@RequestMapping("admin")
@Controller
public class UserServlet {
	@Autowired
	private UserService userService ;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/addUser.action")
	public String addUser(@ModelAttribute User user){
		System.out.println(user);
		userService.addUser(user);
		return "login";
	}
	
}
