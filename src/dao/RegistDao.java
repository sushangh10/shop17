package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import domain.User;
import utils.DataSourceUtils;

public class RegistDao {

	public boolean regist(User user) {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		try {
			String sql = "insert into user values (?,?,?,?,?,?,?,?,?,?)";
			int resutl =qr.update(sql,user.getUid(),user.getUsername(),
					user.getPassword(),user.getName(),user.getEmail(),
					user.getTelephone(),user.getBirthday(),user.getSex(),
					user.getState(),user.getCode());
			return resutl > 0 ? true: false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	
	return false;
}
	public boolean active(String code) {
		try {
			QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
			String sql ="update user set state = ? where code = ?";
			int result = qr.update(sql, 1,code);
			return result>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkUsername(String username) {
		try {
			QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
			String sql ="select * from user where username = ?";
			User user = qr.query(sql, new BeanHandler<>(User.class), username);
			return user == null?false:true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public User login(User user) {
		try {
			QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select * from user where username = ? and password = ?and state=?";
			return qr.query(sql, new BeanHandler<>(User.class), user.getUsername(),user.getPassword(),1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
