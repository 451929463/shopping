package shopping;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;

public class Test1 {
	@Test
	public void testEmail() throws EmailException{
		HtmlEmail email = new HtmlEmail();
		email.setHostName("pop.qq.com");
		email.setCharset("utf-8");
		email.addTo("451929463@qq.com");
		email.setFrom("root.tiankx@lieluobo.com","root");
		email.setAuthentication("451929463@qq.com","stqhpsbcaoqrbgha");//stqhpsbcaoqrbgha
		email.setSubject("激活账号");
		email.setMsg("email内容");
		email.send();//发送
	}
}
