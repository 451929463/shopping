package cn.tri.shop.pojo;

import java.io.Serializable;

public class CarItem implements Serializable{
	private int id;//暂时作为map的id
	private String name;
	private String pictrueAddress;
	private int shopPrices;
	private int commodityNum;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPictrueAddress() {
		return pictrueAddress;
	}
	public void setPictrueAddress(String pictrueAddress) {
		this.pictrueAddress = pictrueAddress;
	}
	public int getShopPrices() {
		return shopPrices;
	}
	public void setShopPrices(int shopPrices) {
		this.shopPrices = shopPrices;
	}
	public int getCommodityNum() {
		return commodityNum;
	}
	public void setCommodityNum(int commodityNum) {
		this.commodityNum = commodityNum;
	}
	public CarItem(int id, String name, String pictrueAddress, int shopPrices,
			int commodityNum) {
		super();
		this.id = id;
		this.name = name;
		this.pictrueAddress = pictrueAddress;
		this.shopPrices = shopPrices;
		this.commodityNum = commodityNum;
	}
	public CarItem() {
		super();
	}
	@Override
	public String toString() {
		return "CatItem [id=" + id + ", name=" + name + ", pictrueAddress="
				+ pictrueAddress + ", shopPrices=" + shopPrices
				+ ", commodityNum=" + commodityNum + "]";
	}
	
	
}
