package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	@Autowired
	private ClientDAO cDao;
	@Autowired
	private AdminDAO aDao;

	@RequestMapping(path = "login.do")
	public String userLogin(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password, HttpSession session) {
		System.out.println("running login");
		User user = null;
		if (username.toLowerCase().equals("admin") && password.equals("12345")) {
			session.setAttribute("tvShows", cDao.getAllShows());
			return "addShow.jsp";
		} else {
			try {
				user = cDao.getUser(username, password);
			} catch (Exception e) {
				session.setAttribute("noUser", true);
				e.printStackTrace();
				return "index.jsp";
			}
			session.setAttribute("user", user);
			return "profileSplash.jsp";
		}
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
		session.removeAttribute("tvShow");
		session.setAttribute("tvShow", tvshow);
		return "addSeason.jsp";
	}
	
	@RequestMapping(path = "shows.do")
	public String shows(HttpSession session) {
		session.setAttribute("tvShows", cDao.getAllShows());
		return "addShow.jsp";
	}
	
	@RequestMapping(path = "editShow.do")
	public String editTVShow(@RequestParam("id") Integer id, HttpSession session) {
		TVShow tvShow = aDao.getTVShowById(id);
		session.removeAttribute("tvShow");
		session.removeAttribute("seasons");
		session.setAttribute("tvShow", tvShow);
		session.setAttribute("seasons", tvShow.getSeasons());
		return "addSeason.jsp";
	}
	
	@RequestMapping(path = "updateShow.do")
	public String updateTVShow(@RequestParam("id") Integer id, TVShow tvShow, HttpSession session) {
		TVShow tvShow1 = aDao.updateTVShow(id, tvShow);
		session.setAttribute("tvShow", tvShow1);
		return "addSeason.jsp";
	}

	@RequestMapping(path = "deleteShow.do")
	public String removeTVShow(@RequestParam("id") Integer id, HttpSession session) {
		try {
			System.out.println(aDao.removeTVShow(id));
		} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("tvShows");
		session.setAttribute("tvShows", cDao.getAllShows());
		return "addShow.jsp";
	}

	@RequestMapping(path = "addSeason.do")
	public String addSeason(Integer tvShowId, Season season, HttpSession session) {
		try {
			aDao.addSeason(tvShowId, season);
		} catch (Exception e) {
			return "error.jsp";
		}
		session.setAttribute("season", season);
		session.setAttribute("tvShow", season.getTvShow());
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "editSeason.do")
	public String editSeason(@RequestParam("id") Integer id, HttpSession session) {
		Season season = aDao.getSeasonById(id);
		session.setAttribute("tvShow", season.getTvShow());
		session.setAttribute("season", season);
		session.setAttribute("episodes", season.getEpisodes());
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "updateSeason.do")
	public String updateSeason(@RequestParam("id") Integer id, Season season, HttpSession session) {
		aDao.updateSeason(id, season);
		return "addEpisode.jsp";
	}

	@RequestMapping(path = "deleteSeason.do")
	public String removeSeason(@RequestParam("id") Integer id, Integer tvShowId, HttpSession session) {
		try {
			System.out.println(aDao.removeSeason(id));
		} catch (Exception e) {
			return "error.jsp";
		}
		TVShow tvShow = aDao.getTVShowById(tvShowId);
		session.removeAttribute("tvShow");
		session.removeAttribute("seasons");
		session.setAttribute("tvShow", tvShow);
		session.setAttribute("seasons", tvShow.getSeasons());
		return "addSeason.jsp";
	}

	@RequestMapping(path = "addEpisode.do")
	public String addEpisode(Integer seasonId, Episode episode, HttpSession session) {
		try {
			aDao.addEpisode(seasonId, episode);
		} catch (Exception e) {
			return "error.jsp";
		}
		Season season = aDao.getSeasonById(seasonId);
		session.setAttribute("tvShow", season.getTvShow());
		session.setAttribute("season", season);
		session.setAttribute("episodes", season.getEpisodes());
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "editEpisode.do")
	public String editEpisode(@RequestParam("id") Integer id, 
							Integer seasonId, HttpSession session) {
		session.setAttribute("episode", aDao.getEpisodeById(id));
		return "editEpisode.jsp";
	}
	
	@RequestMapping(path = "updateEpisode.do")
	public String updateEpisode(@RequestParam("id") Integer id, Episode episode, HttpSession session) {
		Episode updatedEpisode = aDao.updateEpisode(id, episode);
		Season season = updatedEpisode.getSeason();
		session.setAttribute("tvShow", season.getTvShow());
		session.setAttribute("season", season);
		session.setAttribute("episodes", season.getEpisodes());
		return "addEpisode.jsp";
	}

	@RequestMapping(path = "deleteEpisode.do")
	public String removeEpisode(@RequestParam("id") Integer id, Integer seasonId, HttpSession session) {
		try {
			aDao.removeEpisode(id);
		} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("episodes");
		session.setAttribute("episodes", aDao.getSeasonById(seasonId).getEpisodes());
		return "addEpisode.jsp";
	}
}