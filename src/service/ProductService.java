package service;

import java.sql.SQLException;
import java.util.List;

import dao.ProductDao;
import domain.Category;
import domain.Order;
import domain.PageBean;
import domain.Product;
import utils.DataSourceUtils;

public class ProductService {

	private ProductDao dao = new ProductDao();

	public List<Product> getHotProducts() {
		return dao.getHotProducts();
	}

	public List<Product> getNewProducts() {
		return dao.getNewProducts();
	}

	public List<Category> getCategories() {
		return dao.getCategoryies();
	}

	public List<Product> getFirstProducts() {
		// TODO Auto-generated method stub
		return dao.getFirstProducts();
	}

	public List<Product> getSecondProducts() {
		// TODO Auto-generated method stub
		return dao.getSecondProducts();
	}

	public List<Product> getThirdProducts() {
		// TODO Auto-generated method stub
		return dao.getThirdProducts();
	}


	public PageBean<Product> findPorductListCid(String cid,int currentPage,int currentCount) {
		PageBean<Product> pageBean = new PageBean<>();
		//显示第一页数据
		//int currentPage = 1;
		pageBean.setCurrentPage(currentPage);
		//int currentCount = 12;
		pageBean.setCurrentCount(currentCount);
		//获取总条数
		ProductDao dao = new ProductDao();
		int totalCount = dao.getTotal(cid);
		pageBean.setTotalCount(totalCount);
		// 总页数
		int totalPage = (int)Math.ceil(totalCount*1.0 / currentCount);
		pageBean.setTotalPage(totalPage);
		//调用dao获取数据  select form product where cid = ? limit startIndex,currentCount
		int startIndex = (currentPage - 1) * currentCount;
		List<Product> list = dao.findProdutListByCid(cid,startIndex,currentCount);
		pageBean.setList(list);
		return pageBean;
	}


	public Product findProductById(String pid) {
		ProductDao dao = new ProductDao();
		return dao.findProductById(pid);
	}

	//搜索功能
	public List<Product> getSearchProduct(String s) {

		return dao.getSearchProduct(s);
	}

	public List<Product> getCxProducts() {
		// TODO Auto-generated method stub
		return dao.getCxProducts();

	}

	public void submitOrder(Order order) {
		try {
			DataSourceUtils.startTransaction();
			ProductDao dao = new ProductDao();
			dao.addOrder(order);
			dao.addOrderItems(order);
		} catch (Exception e) {
			try {
				DataSourceUtils.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				DataSourceUtils.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void updateOrderInfo(Order order) {
		ProductDao dao = new ProductDao();
		dao.updateOrderInfo(order);
		
	}


}
