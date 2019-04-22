package cn.tri.shop.servlet;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;
import cn.tri.shop.util.MyUtil;
@Controller
@RequestMapping("admin")
@SessionAttributes("user")
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
		return "index";
	}

	@RequestMapping("/loginUser.action")
	public String loginUser(@RequestParam String uname,@RequestParam String upwd,Map map) throws EmailException{
		User user = new User();
		user.setUname(uname);
		user.setUpwd(upwd);
		System.out.println(upwd);
		User u = userService.loginUser(user);
		if(u.getActivestatus() == 0){
			MyUtil.avtiveEmail(u);
			map.put("status", "您的账号未激活，请前往您绑定的的邮箱点击链接激活！");
			return "MyJsp";
		}
		map.put("user", u);
		return "index";
	}
	
	@RequestMapping("/activeEmail.action")
	public String activeEmail(@RequestParam String email , @RequestParam String code,Map<String,String> map){
		System.out.println(email+code);
		User user = new User();
		user.setActivenum(Integer.parseInt(code));
		user.setEmail(email);
		userService.activeUser(user);
		int status = userService.checkActive(user);
		if(status == 0){
			map.put("activeStatus", "账号激活失败");
		}else{
			map.put("activeStatus", "账号激活成功");
		}
		return "MyJsp";
	}
	
	
	@RequestMapping("loginOut.action")
	public String loginOut(HttpServletRequest req){
		req.removeAttribute("user");
		System.out.println("req"+req.getAttribute("user"));
		//清除session
		req.getSession().invalidate();
		
		System.out.println("sess"+req.getSession().getAttribute("user"));
		System.out.println("-----------------req---sess-----------");
		return "redirect:/MyJsp.jsp";
	}
}
