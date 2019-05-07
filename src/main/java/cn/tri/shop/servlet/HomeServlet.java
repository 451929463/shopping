package cn.tri.shop.servlet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeServlet {
	@RequestMapping("/home.action")
	public String home(){
		System.out.println("11111111111111");
		return "index";
	}
}
