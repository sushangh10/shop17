package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import domain.Category;
import domain.User;
import utils.DataSourceUtils;

public class AdminCategoryDao {


		// TODO Auto-generated method stub
		public void addCategory(Category category) {
			QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
			try {
				String sql = "insert into category values (?,?)";
				qr.update(sql, category.getCid(),category.getCname());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	

}
