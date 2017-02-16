package controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.AdminDAO;
import data.ClientDAO;
import entities.Episode;
import entities.Party;
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
			// System.out.println("******user.getID() after userLogin: " +
			// user.getId());
			if (user != null) {
				resetSessionAttributes(session, user.getId());
			} else {
				session.setAttribute("noUser", true);
				return "index.jsp";
			}
			// System.out.println("**** number of shows: " +
			// user.getTvShows().size());
			// for (TVShow s : user.getTvShows()) {
			// System.out.println("**** number of seasons in " + s.getTitle() +
			// s.getSeasons().size());
			// }
			return "profileSplash.jsp";
		}
	}

	private void resetSessionAttributes(HttpSession session, Integer userId) {
		User user = cDao.getUserByUserId(userId);
		user.setTvShows(cDao.cleanUserTVShows(userId));
		session.setAttribute("user", user);
	}

	@RequestMapping(path = "addUser.do")
	public String addUser(@RequestParam(name = "passwordConfirm") String passwordConfirm, User user,
			HttpSession session) {
		if (user.getPassword().equals(passwordConfirm)) {
			try {
				user.setImgUrl("img/defaultUser.jpg");
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
	public String editEpisode(@RequestParam("id") Integer id, Integer seasonId, HttpSession session) {
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
		// session.setAttribute("userId", userId);
		// System.out.println("******** userId in trackShow(): " + userId);
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

	@RequestMapping(path = "watchEpisode.do")
	public String watchEpisode(HttpSession session, Integer userId, Integer seasonId, Integer... watchedEpisodes) {
		if (watchedEpisodes == null) {
			watchedEpisodes = new Integer[0];
		}
		cDao.updateSeason(userId, seasonId, watchedEpisodes);

		resetSessionAttributes(session, userId);
		return "profileSplash.jsp";
	}

	@RequestMapping(path = "logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "index.jsp";
	}

	@RequestMapping(path = "manageParties.do")
	public String manageParties(HttpSession session) {
		User user = cDao.getUserByUserId(((User) session.getAttribute("user")).getId());
		// user.setParties(cDao.loadUserParties(user.getId()));
		List<Party> userParties = user.getParties();
		List<Party> tempParties = new ArrayList<>();
		List<Party> parties = cDao.getAllParties();
		boolean userHasParty = false;
		if (userParties.size() == 0) {
			tempParties = parties;
		} else {
			for (Party party : parties) {
				for (Party p : userParties) {
					if (party.getId() == p.getId()) {
						userHasParty = true;
						break;
					}
				}
				if (!userHasParty) {
					tempParties.add(party);
				}
				userHasParty = false;
			}
		}
		session.removeAttribute("user");
		session.setAttribute("user", user);
		session.removeAttribute("tvShows");
		session.setAttribute("tvShows", cDao.getAllShows());
		session.removeAttribute("nonUserParties");
		session.setAttribute("nonUserParties", tempParties);
		return "editParty.jsp";
	}

	@RequestMapping(path = "addParty.do")
	public String addParty(String partyName, Integer userId, HttpSession session, Integer ... tvShows ) {
		try {
			Party p = new Party();
			p.setName(partyName);
			p = cDao.addParty(p);
			p = cDao.addUsersToParty(p.getId(), userId);
			List<TVShow> tvs = cDao.addTVShowsToParty(p.getId(), tvShows);
			System.out.println(tvs);
		} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("parties");
		session.setAttribute("parties", cDao.getAllParties());
		return manageParties(session);
	}
	
	@RequestMapping(path = "leaveParty.do", params="leaveGroup")
	public String leaveParty(Integer partyId, HttpSession session) {
		try {
			int userId = ((User)session.getAttribute("user")).getId();
			cDao.removeUsersFromParty(partyId, userId);

		} catch (Exception e) {
			return "error.jsp";
		}
		
		return manageParties(session);
	}

	@RequestMapping(path = "leaveParty.do", params="deleteGroup")
	public String deleteParty(Integer partyId, HttpSession session) {
		try {
			cDao.deleteParty(partyId);
		} catch (Exception e) {
			return "error.jsp";
		}
		return manageParties(session);
	}
	
	@RequestMapping(path = "addUsersToParty.do")
	public String addUsersToParty(@RequestParam("partyId") Integer partyId, HttpSession session,
			@RequestParam("userId") Integer... userIds) {
		try {
			Party party = cDao.addUsersToParty(partyId, userIds);
			System.out.println(party);
		} catch (Exception e) {
			return "error.jsp";
		}
		// Need to set attribute for new users added to party. Need method
		// getUsersInParty DAO method to return list of users in a party?
		session.removeAttribute("parties");
		session.setAttribute("parties", cDao.getAllParties());
		return manageParties(session);
	}

	@RequestMapping(path = "addTVShowsToParty.do")
	public String addTVShowsToParty(@RequestParam("tvShowId") List<Integer> tvShowIds,
			@RequestParam("partyId") Integer partyId, HttpSession session) {
		try {
			for (Integer i : tvShowIds) {
				cDao.addTVShowsToParty(partyId, i);
			}
		} catch (Exception e) {
			return "error.jsp";
		}
		session.removeAttribute("parties");
		session.removeAttribute("");
		session.setAttribute("", cDao.getAllParties());
		session.setAttribute("parties", cDao.getAllParties());
		return "editParty.jsp";
	}
}