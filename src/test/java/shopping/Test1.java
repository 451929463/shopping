package shopping;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tri.shop.pojo.User;
import cn.tri.shop.service.UserService;

public class Test1 {
	@Test
	public void testEmail() throws EmailException{
		SimpleEmail email = new SimpleEmail(); 
		email.setHostName("smtp.163.com");
		email.setCharset("utf-8");
		email.addTo("451929463@qq.com","as");
		email.setFrom("xuan199511@163.com","admin");
		email.setAuthentication("xuan199511@163.com","admin1995");//stqhpsbcaoqrbgha
		email.setSubject("激活账号11111111111111111");
		email.setMsg("email内容");
		email.send();//发送
	}
	@Test
	public void test2(){
		String ss = "123.456.789";
		String[] arr = ss.split("\\.");
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}
}
