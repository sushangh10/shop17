package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import domain.Category;
import domain.Order;
import domain.OrderItem;
import domain.Product;
import utils.DataSourceUtils;

public class ProductDao {
	private QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
	private String sql = "";
	int x=1+(int)(Math.random()*4);
	
	//获取热门商品
	public List<Product> getHotProducts() {
		try {
			sql = "select * from product where is_hot = ? limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), 1,0,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//获取最新商品
	public List<Product> getNewProducts() {
		try {
			sql = "select * from product order by pdate desc limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), 0,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public List<Product> getFirstProducts() {
		// TODO Auto-generated method stub
		try {
			sql = "select * from product where cid = ? limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), x+1,0,8);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List<Product> getSecondProducts() {
		try {
			sql = "select * from product where cid = ? limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), x+2,0,8);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return null;
	}
	public List<Product> getThirdProducts() {
		try {
			sql = "select * from product where cid = ? limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), x+3,0,8);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Category> getCategoryies() {
		try {
			sql = "select * from category";
			return qr.query(sql, new BeanListHandler<>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//获取总记录数
	public int getTotal(String cid) {
		sql = "select count(*) from product where cid = ?";
		Long rows = 0L;
		//ScalarHandler() 能够返回一行一列的数据
		try {
			rows =  (Long) qr.query(sql, new ScalarHandler(), cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rows.intValue();
	}
	
	public List<Product> findProdutListByCid(String cid, int startIndex, int currentCount) {
		sql = "select * from product where cid = ? limit ?,?";
		try {
			return qr.query(sql, new BeanListHandler<>(Product.class), cid,startIndex,currentCount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Product findProductById(String pid) { 
		sql = "select * from product where pid = ?";
		Product product = null;
		try {
			product = qr.query(sql, new BeanHandler<>(Product.class), pid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	//搜索功能
	public List<Product> getSearchProduct(String s) {
		sql="select * from product where pdesc like  \"%\"?\"%\"";
					
			try {
				return qr.query(sql, new BeanListHandler<>(Product.class), s);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}

	public List<Product> getCxProducts() {
		try {
			sql = "select * from product order by ZK asc limit ?,?";
			return qr.query(sql, new BeanListHandler<>(Product.class), 0,5);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public void addOrder(Order order) {
		try {
			QueryRunner qr1 =new QueryRunner();
			sql = "insert into orders values(?,?,?,?,?,?,?,?)";
			Connection conn = DataSourceUtils.getConnection();
			qr1.update(conn, sql, order.getOid(),order.getOrdertime(),order.getTotal(),
					order.getState(),order.getAddress(),order.getName(),order.getTelephone(),
					order.getUser().getUid());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public void addOrderItems(Order order) {
		try {
			QueryRunner qr1 =new QueryRunner();
			Connection conn = DataSourceUtils.getConnection();
			for (OrderItem item : order.getOrderItems()) {
				sql = "insert into orderitem values (?,?,?,?,?)";
				qr1.update(conn, sql, item.getItemid(),item.getCount(),
						item.getSubtotal(),item.getProduct().getPid(),order.getOid());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void updateOrderInfo(Order order) {
		sql="update orders set address = ?,name=?,telephone=? where oid =?";
		try {
			qr.update(sql, order.getAddress(),order.getName(),order.getTelephone(),order.getOid());
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	

}
