package cn.tri.shop.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tri.shop.pojo.User;
@Controller
public class UserServlet {
	@RequestMapping("/addUser")
	public String addUser(/*@RequestParam User user*/){
		System.out.println("-------------------");
		return "login";
	}
}
