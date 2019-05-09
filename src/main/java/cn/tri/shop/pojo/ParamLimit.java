package cn.tri.shop.pojo;
/**
 * 将用于分页查询的参数，封装成一个类
 * @author Administrator
 * param{
 * 			tid:商品类型
 * 			index:第index行数据
 * 			size:数据条数
 * 		}
 */
public class ParamLimit {
	private int tid;
	private int index;
	private int size;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public ParamLimit(int tid, int index, int size) {
		super();
		this.tid = tid;
		this.index = index;
		this.size = size;
	}
	public ParamLimit() {
		super();
	}
	@Override
	public String toString() {
		return "ParamLimit [tid=" + tid + ", index=" + index + ", size=" + size
				+ "]";
	}
	
	
}
