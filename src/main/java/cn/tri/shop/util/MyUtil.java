package cn.tri.shop.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import cn.tri.shop.pojo.User;

public class MyUtil {
	//激活邮箱
	public static void avtiveEmail(User user) throws EmailException {
		SimpleEmail email = new SimpleEmail();
		email.setHostName("smtp.163.com");
		email.setCharset("utf-8");
		System.out.println(user.getEmail()+"------------------"+user.getUname());
		email.addTo(user.getEmail(),user.getUname());
		email.setFrom("xuan199511@163.com", "shopping service");
		email.setAuthentication("xuan199511@163.com", "admin1995");
		email.setSubject("来自shopping的激活邮件");
		email.setMsg("点击激活：http://localhost:8080/shopping/admin/activeEmail.action?email="+user.getEmail()+"&code="+"1234");
		email.send();
		
	/*	SimpleEmail email1 = new SimpleEmail(); 
		email.setHostName("smtp.163.com");
		email.setCharset("utf-8");
		email.addTo("xuan199511@qq.com","as");
		email.setFrom("xuan199511@163.com","admin");
		email.setAuthentication("xuan199511@163.com","admin1995");//stqhpsbcaoqrbgha
		email.setSubject("激活账号");
		email.setMsg("email内容");
		email.send();//发送
*/	}
}
