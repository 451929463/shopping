package cn.tri.shop.pojo;

public class Commodity {
	private int cid ;
	private String cname ;
	private String info ;
	private int marketPrice ;
	private int shopPrice ;
	private String pictrueAddress ;
	private int hot ;
	private int putaway ;
	private int t_id;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getMarketPrice() {
		return marketPrice;
	}
	public void setMarketPrice(int marketPrice) {
		this.marketPrice = marketPrice;
	}
	public int getShopPrice() {
		return shopPrice;
	}
	public void setShopPrice(int shopPrice) {
		this.shopPrice = shopPrice;
	}
	public String getPictrueAddress() {
		return pictrueAddress;
	}
	public void setPictrueAddress(String pictrueAddress) {
		this.pictrueAddress = pictrueAddress;
	}
	public int getHot() {
		return hot;
	}
	public void setHot(int hot) {
		this.hot = hot;
	}
	public int getPutaway() {
		return putaway;
	}
	public void setPutaway(int putaway) {
		this.putaway = putaway;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public Commodity(int cid, String cname, String info, int marketPrice,
			int shopPrice, String pictrueAddress, int hot, int putaway, int t_id) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.info = info;
		this.marketPrice = marketPrice;
		this.shopPrice = shopPrice;
		this.pictrueAddress = pictrueAddress;
		this.hot = hot;
		this.putaway = putaway;
		this.t_id = t_id;
	}
	public Commodity() {
		super();
	}
	@Override
	public String toString() {
		return "Commodity [cid=" + cid + ", cname=" + cname + ", info=" + info
				+ ", marketPrice=" + marketPrice + ", shopPrice=" + shopPrice
				+ ", pictrueAddress=" + pictrueAddress + ", hot=" + hot
				+ ", putaway=" + putaway + ", t_id=" + t_id + "]";
	}
	
}
