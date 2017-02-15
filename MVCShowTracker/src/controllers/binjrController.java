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
import entities.UserEpisode;

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
			System.out.println("******user.getID() after userLogin: " + user.getId());
			resetSessionAttributes(session, user);
			System.out.println("**** number of shows: " + user.getTvShows().size());
			for (TVShow s : user.getTvShows()) {
				System.out.println("**** number of seasons in " + s.getTitle() + s.getSeasons().size());
			}
			return "profileSplash.jsp";
		}
	}

	private void resetSessionAttributes(HttpSession session, User user) {
		user = cDao.getUserByUserId(user.getId());
		user.setTvShows(cDao.cleanUserTVShows(user.getId()));
		session.setAttribute("user", user);
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
		session.removeAttribute("seasons");
		session.setAttribute("tvShow", tvshow);
		return "addSeason.jsp";
	}
	
	@RequestMapping(path = "shows.do")
	public String shows(HttpSession session) {
		session.removeAttribute("tvShows");
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
		session.removeAttribute("season");
		session.removeAttribute("tvShow");
		session.removeAttribute("episodes");
		session.setAttribute("season", season);
		session.setAttribute("episodes", season.getEpisodes());
		session.setAttribute("tvShow", season.getTvShow());
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "editSeason.do")
	public String editSeason(@RequestParam("id") Integer id, HttpSession session) {
		Season season = aDao.getSeasonById(id);
		session.removeAttribute("tvShow");
		session.removeAttribute("season");
		session.removeAttribute("episodes");
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
		session.removeAttribute("tvShow");
		session.removeAttribute("season");
		session.removeAttribute("episodes");
		session.setAttribute("tvShow", season.getTvShow());
		session.setAttribute("season", season);
		session.setAttribute("episodes", season.getEpisodes());
		return "addEpisode.jsp";
	}
	
	@RequestMapping(path = "editEpisode.do")
	public String editEpisode(@RequestParam("id") Integer id, 
							Integer seasonId, HttpSession session) {
		Episode episode = aDao.getEpisodeById(id);
		session.removeAttribute("episode");
		session.removeAttribute("season");
		session.setAttribute("season", episode.getSeason());
		session.setAttribute("episode", episode);
		return "editEpisode.jsp";
	}
	
	@RequestMapping(path = "updateEpisode.do")
	public String updateEpisode(@RequestParam("id") Integer id, Episode episode, HttpSession session) {
		Episode updatedEpisode = aDao.updateEpisode(id, episode);
		Season season = updatedEpisode.getSeason();
		session.removeAttribute("tvShow");
		session.removeAttribute("season");
		session.removeAttribute("episodes");
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
	
	@RequestMapping(path = "trackShow.do")
	public String trackShow(HttpSession session) {
//		session.setAttribute("userId", userId);
//		System.out.println("******** userId in trackShow(): " + userId);
		session.setAttribute("allTVShows", cDao.getAllShows());
		return "trackShow.jsp";
	}
	
	@RequestMapping(path = "trackNewShows.do")
	public String trackNewShows(HttpSession session, Integer userId, Integer... tvShowIds) {
		try {
			System.out.println("*********** userId IN TRACK NEW SHOWS: " + userId);
			for (int i : tvShowIds) {
				System.out.println("*********** tvShowIDs IN TRACK NEW SHOWS: " + i);
				cDao.addUserShow(userId, i);
			}
		} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("user");
		session.setAttribute("user", cDao.getUserByUserId(userId));
		return "profileSplash.jsp";
	}
	
	@RequestMapping(path="watchEpisode.do")
	public String watchEpisode(HttpSession session, Integer userId, Integer episodeId, Integer watched){
		try {
			UserEpisode ue = new UserEpisode();
			ue.setUser(cDao.getUserByUserId(userId));
			ue.setEpisode(aDao.getEpisodeById(episodeId));
			ue.setWatched(watched);				
			System.out.println("******* BEFORE UserEpisode in watchEpisode(): " + ue);
			ue = cDao.watchEpisode(ue);
			System.out.println("******* AFTER UserEpisode in watchEpisode(): " + ue);
			} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("user");
		session.setAttribute("user", cDao.getUserByUserId(userId));
		return "profileSplash.jsp";
	}
}