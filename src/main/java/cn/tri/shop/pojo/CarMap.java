package cn.tri.shop.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class CarMap {
	private CarItem carItem;
	private int totalPrice;
	public CarItem getCarItem() {
		return carItem;
	}
	public void setCarItem(CarItem carItem) {
		this.carItem = carItem;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	//加入购物车
	public Map addCarItem(CarItem carItem,HttpSession session){
		Map map = (Map) session.getAttribute("map");
		if(map != null){
			List<CarItem> cars = (List<CarItem>) map.get("cars");
			totalPrice = (int) map.get("totalPrice");
			for (int i = 0; i < cars.size(); i++) {
				if(cars.get(i).getId() == carItem.getId()){
					
					cars.get(i).setCommodityNum(cars.get(i).getCommodityNum()+carItem.getCommodityNum());
					cars.get(i).setShopPrices(carItem.getShopPrices()*cars.get(i).getCommodityNum());
					totalPrice = 0 ;
					for (int j = 0; j < cars.size(); j++) {
						totalPrice += cars.get(j).getCommodityNum()*cars.get(j).getShopPrices();
					}
					map.put("totalPrice", totalPrice);
					map.put("cars", cars);
					return map;
				}
			}
			cars.add(carItem);
			totalPrice += carItem.getCommodityNum()*carItem.getShopPrices();
			map.put("totalPrice", totalPrice);
			map.put("cars", cars);
			return map;
		}else{
			Map map1 = new HashMap();
			List<CarItem> cars = new ArrayList<>();
			System.out.println(cars+"-----");
			System.out.println(carItem);
			cars.add(carItem);
			totalPrice = 0;
			totalPrice = carItem.getCommodityNum()*carItem.getShopPrices();
			map1.put("totalPrice", totalPrice);
			map1.put("cars", cars);
			return map1;
		}
		
	}
	//删除购物车商品
	public void delCarItem(int id,HttpSession session){
		Map map = (Map) session.getAttribute("map");
		List<CarItem> cars = (List<CarItem>) map.get("cars");
		Iterator<CarItem> iterator = cars.iterator();
		while (iterator.hasNext()) {
			if(id==iterator.next().getId()){
				/*System.out.println(iterator.next());
				totalPrice = (int) map.get("totalPrice")-iterator.next().getCommodityNum()*iterator.next().getShopPrices();
				map.put("totalPrice", totalPrice);
				map.put("cars", cars);*/
				iterator.remove();
				totalPrice = (int) map.get("totalPrice")-iterator.getCommodityNum()*iterator.getShopPrices();
			}
		}
	}
	
}
