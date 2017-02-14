package testadmin;

import data.AdminDAO;
import data.AdminDAOImpl;

public class TestClass {
	public static void main(String[] args) {
		AdminDAO dao = new AdminDAOImpl();
		
		dao.removeTVShow(1);
	}

}
