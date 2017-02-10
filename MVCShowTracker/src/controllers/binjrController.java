package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import entities.User;

@Controller
public class binjrController {
//	private clientDAO cDao = new ClientDAOImpl();
//	private adminDAO aDao = new AdminDAOImpl();
	
	
	@RequestMapping(path="login.do")
	public String userLogin(User user, HttpSession session){
		session.setAttribute("user", user);
		return "profileSplash.jsp";
	}

	@RequestMapping(path="addUser.do")
	public String addUser(User user, HttpSession session){
//		cDao.addUser(user);
		return "index.jsp";
	}

	@RequestMapping(path="goHome.do")
	public String goHome(User user, HttpSession session){
//		cDao.addUser(user);
		return "index.jsp";
	}

}
