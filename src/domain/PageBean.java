package domain;

import java.util.List;

public class PageBean<T> {
	//��ǰҳ
	private int currentPage;
	//ÿҳ��ʾ������
	private int currentCount;
	//��ҳ ��
	private int totalPage;
	//�ܼ�¼��
	private int totalCount;
	//����
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
