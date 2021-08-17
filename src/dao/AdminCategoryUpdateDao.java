package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import domain.Category;
import utils.DataSourceUtils;

public class AdminCategoryUpdateDao {

	public void edit(String cname ,String cid) {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		try {
			String sql = "update category set cname = ? where cid= ?";
			qr.update(sql,cname,cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}





