package cn.tri.shop.pojo;

import java.util.List;

public class PageBean {
	private int pageNum ; //当前页
	private int pageSize; //每页记录数
	private int totalRecord; //总记录数
	
	private int totalPage;//总页数
	private int startIndex;//开始索引
	
	//每页记录数的集合
	private List list;
	
	private int start; //能看见的开始页数
	private int end; //能看见的结尾页数
	
	public PageBean(int pageNum, int pageSize, int totalRecord) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		//获取总页数
		if(totalRecord%pageSize == 0){
			this.totalPage = totalRecord/pageSize;
		}else{
			this.totalPage = totalRecord/pageSize+1;
		}

		this.startIndex = (pageNum - 1)*pageSize;
		//初始值
		this.start = 1;
		this.end = 5;
		if(totalPage <= 5){
			this.end = totalPage;
		}else{
			this.start = pageNum - 2;
			this.end = pageNum + 2;
			if(start < 0){
				this.start = 1;
				this.end = 5;
			}
			if(end > totalPage){
				this.end = totalPage;
				this.start = end - 5;
			}
		}
		
		
		
		
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "PageBean [pageNum=" + pageNum + ", pageSize=" + pageSize
				+ ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", startIndex=" + startIndex + ", list=" + list + ", start="
				+ start + ", end=" + end + "]";
	}
	
}
