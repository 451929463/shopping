package cn.tri.shop.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import cn.tri.shop.pojo.User;

public class MyUtil {
	//激活邮箱
	public static void avtiveEmail(User user) throws EmailException {
		String urlEmail = user.getEmail();
		String uname = user.getUname();	
		SimpleEmail email = new SimpleEmail();
		email.setHostName("smtp.163.com");
		email.setCharset("utf-8");
		email.addTo(urlEmail,uname);
		email.setFrom("xuan199511@163.com","admin");
		email.setAuthentication("xuan199511@163.com","admin1995");
		email.setSubject("激活账号11111111111111111");
		email.setMsg("点击激活：http://localhost:8080/shopping/admin/activeEmail.action?email="+user.getEmail()+"&code="+"1234");
		email.addTo(user.getEmail(),user.getUname());
		email.send();//发送
		System.out.println("发送成功");
		
	}
}
