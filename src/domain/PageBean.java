package domain;

import java.util.List;

public class PageBean<T> {
	//当前页
	private int currentPage;
	//每页显示的条数
	private int currentCount;
	//总页 数
	private int totalPage;
	//总记录数
	private int totalCount;
	//数据
	private List<T> list;
	/**
	 * 
	 */
	public PageBean() {
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
