package cn.tri.shop.pojo;

import java.io.Serializable;

public class TypeCommodity {
	private int tid ;
	private String tname ;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public TypeCommodity(int tid, String tname) {
		super();
		this.tid = tid;
		this.tname = tname;
	}
	public TypeCommodity() {
		super();
	}
	@Override
	public String toString() {
		return "TypeCommodity [tid=" + tid + ", tname=" + tname + "]";
	}
	
	
}
