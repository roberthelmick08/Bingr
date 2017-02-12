package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.AdminDAO;
import data.ClientDAO;
import entities.Episode;
import entities.Season;
import entities.TVShow;
import entities.User;

@Controller
public class binjrController {
	private ClientDAO cDao = null;
	private AdminDAO aDao = null;

	@RequestMapping(path = "login.do")
	public String userLogin(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, HttpSession session) {
		User user = null;
		try {
			user = cDao.getUser(username, password);
		} catch (Exception e) {
			session.setAttribute("noUser", true);
			return "index.jsp";
		}
		session.setAttribute("user", user);
		return "profileSplash.jsp";
	}

	@RequestMapping(path = "addUser.do")
	public String addUser(@RequestParam(name = "passwordConfirm") String passwordConfirm, User user,
			HttpSession session) {
		if (user.getPassword() == passwordConfirm) {
			try {
				cDao.createUser(user);
			} catch (Exception e) {
				return "error.jsp";
			}
		} else {
			session.setAttribute("doesNotMatch", true);
		}
		return "index.jsp";
	}

	@RequestMapping(path = "goHome.do")
	public String goHome(HttpSession session) {
		return "profileSplash.jsp";
	}

	@RequestMapping(path = "addShow.do")
	public String addTVShow(TVShow tvshow, HttpSession session) {
		try {
			aDao.addTVShow(tvshow);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "addSeason.jsp";
	}

	@RequestMapping(path = "deleteShow.do")
	public String deleteTVShow(TVShow tvshow, HttpSession session) {
		try {
			aDao.deleteTVShow(tvshow);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "addSeason.jsp";
	}

	@RequestMapping(path = "addSeason.do")
	public String addSeason(Season season, HttpSession session) {
		try {
			aDao.addSeason(season);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "deleteSeason.do")
	public String deleteSeason(Season season, HttpSession session) {
		try {
			aDao.deleteSeason(season);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "addEpisode.jsp";
	}

	@RequestMapping(path = "addEpisode.do")
	public String addEpisode(Episode episode, HttpSession session) {
		try {
			aDao.addEpisode(episode);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "profileSplash.jsp";
	}

	@RequestMapping(path = "deleteEpisode.do")
	public String deleteEpisode(Episode episode, HttpSession session) {
		try {
			aDao.deleteEpisode(episode);
		} catch (Exception e) {
			return "error.jsp";
		}
		return "profileSplash.jsp";
	}
}