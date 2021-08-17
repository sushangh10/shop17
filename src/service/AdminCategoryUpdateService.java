package service;

import dao.AdminCategoryUpdateDao;
import domain.Category;

public class AdminCategoryUpdateService {

	public void editCategory(String cname,String cid) {
		// TODO Auto-generated method stub
		AdminCategoryUpdateDao adminCategoryUpdateDao = new AdminCategoryUpdateDao();
		adminCategoryUpdateDao.edit(cname, cid);
		
	}

	

}
