package cn.tri.shop.servlet;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String addUser(User user,SessionStatus sessionStatus){
		System.out.println(user.getEmail()+user.getUname());
		userService.addUser(user);
		sessionStatus.setComplete();
		return "redirect:/index.jsp";
	}

	@RequestMapping("/loginUser.action")
	public String loginUser(HttpServletRequest req,HttpServletResponse resp,@RequestParam String uname,@RequestParam String upwd ,@RequestParam (required=false,defaultValue="unok")String whether , Map map) throws EmailException, UnsupportedEncodingException{
		User user = new User();
		user.setUname(uname);
		user.setUpwd(upwd);
		User u = userService.loginUser(user);
		if(u.getActivestatus() == 0){
			MyUtil.avtiveEmail(u);
			map.put("status", "您的账号未激活，请前往您绑定的的邮箱点击链接激活！");
			return "MyJsp";
		}
		if(whether.equals("ok")){
			cookieAction(uname, req, resp);
		}
		map.put("user", user);
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
		return "index";
	}
	
	
	@RequestMapping("loginOut.action")
	public String loginOut(HttpServletRequest req,SessionStatus sessionStatus){
		req.removeAttribute("user");
		System.out.println("req"+req.getAttribute("user"));
		System.out.println(req.getSession().getAttribute("user"));
		sessionStatus.setComplete();
		System.out.println(req.getSession().getAttribute("user"));
		
		//清除session
		/*req.getSession().removeAttribute("user");
		
		System.out.println("sess"+req.getSession().getAttribute("user"));
		System.out.println("-----------------req---sess-----------");
		
		 Cookie[] cookies = req.getCookies();//根据请求数据，找到cookie数组

	        if (null==cookies) {//如果没有cookie数组
	        
	            System.out.println("没有cookie");
	        } else {
	            for(Cookie cookie : cookies){
	                System.out.println("cookieName:"+cookie.getName()+",cookieValue:"+ cookie.getValue());
	            }
	        }*/
		return "redirect:/MyJsp.jsp";
	}
	
	/*
	 * cookie方法
	 * */
	private void cookieAction(String uname,HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException{
		Cookie cookie = new Cookie("uname",URLEncoder.encode(uname, "utf-8"));
		cookie.setPath(req.getContextPath()+"/");
		cookie.setMaxAge(2*60);
		resp.addCookie(cookie);
	}
}
