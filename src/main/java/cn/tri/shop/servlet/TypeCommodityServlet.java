package cn.tri.shop.servlet;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.tri.shop.pojo.TypeCommodity;
import cn.tri.shop.service.TypeCommodityService;
@Controller
@RequestMapping("typeCommodity")
public class TypeCommodityServlet {
	@Autowired
	private TypeCommodityService typeCommodityService ;

	public void setTypeCommodityService(TypeCommodityService typeCommodityService) {
		this.typeCommodityService = typeCommodityService;
	}
	@RequestMapping(value="/findAll.action",produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findAll(HttpServletRequest req) throws IOException{
		List<TypeCommodity> list = typeCommodityService.findAll();
		req.getSession().setAttribute("list", list);
		Gson gson = new Gson();
		String commoditys = gson.toJson(list);
		return commoditys;
	}

}
