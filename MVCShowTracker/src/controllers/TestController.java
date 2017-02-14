package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import data.AdminDAO;

@Controller
public class TestController {
	@Autowired
	AdminDAO dao;
	
	@RequestMapping(path = "test.do")
	public void test() {
		dao.removeTVShow(1);
	}
}
