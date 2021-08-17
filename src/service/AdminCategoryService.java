package service;

import dao.AdminCategoryDao;
import domain.Category;

public class AdminCategoryService {

	public void addCategory(Category category) {
		// TODO Auto-generated method stub
		AdminCategoryDao categoryDao = new AdminCategoryDao();
		categoryDao.addCategory(category);
		
	}

}
