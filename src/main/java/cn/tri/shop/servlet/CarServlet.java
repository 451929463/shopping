package cn.tri.shop.servlet;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tri.shop.pojo.CarItem;
import cn.tri.shop.pojo.CarMap;

@Controller
@RequestMapping("car")
public class CarServlet {
	
	@RequestMapping("/addCarItem.action")
	public String addCatItem(CarItem carItem,HttpSession session){
		CarMap cm = new CarMap();
		session.setAttribute("map", cm.addCarItem(carItem, session));
		return "forward:/car.jsp";
	}
	@RequestMapping("/delCarItem.action")
	public String delCarItem(@RequestParam int id,HttpSession session){
		CarMap cm = new CarMap();
		cm.delCarItem(id, session);
		return "forward:/car.jsp";
	}
}
