package cn.tri.shop.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import cn.tri.shop.pojo.Commodity;
import cn.tri.shop.service.CommodityService;

@Controller
@RequestMapping("commodity")
public class CommodityServlet {
	@Autowired
	private CommodityService commodityService ;

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}
	
	@RequestMapping(value="/findBytid.action",produces="application/json; charset=utf-8")
	@ResponseBody
	public String findBytid(@RequestParam int tid,@RequestParam int index,@RequestParam int size){
		System.out.println(tid+"---"+index+"---"+size);
		List<Commodity> commoditys = commodityService.findBytid(tid,index,size);
		System.out.println(commoditys);
		Gson gson = new Gson();
		String commodityGson = gson.toJson(commoditys);
		return commodityGson;
	}
	
	/**
	 * @param commodity
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/addCommodity.action",method=RequestMethod.POST)
	public String addCommodity(Commodity commodity,@RequestParam(value="pic",required=false) MultipartFile file) throws IOException{
		String relname = file.getOriginalFilename();
		String[] arr = relname.split("\\.");
		Date date = new Date();
		InputStream is = file.getInputStream();
		String url = date.getTime()+"."+arr[1];
	    String picPath = "D:\\img\\"+ url ;
		OutputStream os = new FileOutputStream(picPath);
		//缓存空间
		byte[] byt = new byte[1024];
		int len = -1;
		while((len=is.read(byt))!=-1){
			os.write(byt, 0, len);
		}
		os.close();
		is.close();
		commodity.setPictrueAddress(url);
		commodityService.addCommodity(commodity);
		return "redirect:/seller.jsp";
	}
	@RequestMapping(value="/findBycid.action",produces="application/json;charset=utf-8")
	public String findBycid(@RequestParam String cid,Map map){
		Commodity commodity = commodityService.findBycid(Integer.parseInt(cid));
		map.put("commodity", commodity);
		return "commodity_info";
	}
	
	@RequestMapping("/alterCommodity.action")
	public String alterCommodity(Commodity commodity){
		System.out.println(commodity);
		commodityService.alterCommodity(commodity);
		return "seller";
	}
	@RequestMapping("/deleteCommodity.action")
	public String deleteCommodity(@RequestParam String cid,@RequestParam String t_id){
		commodityService.deleteCommodity(Integer.parseInt(cid));
		return "seller";
	}
	@RequestMapping(value="/findByHot.action",produces="application/json;charset=utf-8")
	@ResponseBody
	public String findByHot(@RequestParam int hot){
		List<Commodity> list = commodityService.findByHot(hot);
		Gson gson = new Gson();
		String commoditys = gson.toJson(list);
		System.out.println(commoditys);
		return commoditys;
	}
}
