package cn.tri.shop.servlet;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tri.shop.pojo.CutItem;

@Controller
@RequestMapping("cat")
public class CutServlet {
	@RequestMapping("/addCatItem.action")
	public String addCatItem(CutItem item,HttpSession session){
		System.out.println(item);
		return "";
	}
}
