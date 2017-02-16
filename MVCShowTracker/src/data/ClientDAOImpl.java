package data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Episode;
import entities.Party;
import entities.Season;
import entities.TVShow;
import entities.User;
import entities.UserEpisode;

@Repository
@Transactional
public class ClientDAOImpl implements ClientDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public User getUser(String username, String password) {
		try {
			String queryString = "select u from User u where u.username = :username AND u.password = :password";
			System.out.println("PASSWORD IS: " + password);
			User user = em.createQuery(queryString, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User getUserByUserId(int id) {
		try {
			String queryString = "select u from User u where u.id = :id";
			User user = em.createQuery(queryString, User.class).setParameter("id", id).getSingleResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party getPartyById(int id) {
		try {
			Party party = em.find(Party.class, id);
			return party;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// @Override
	// public UserEpisode getTvShowById(int id) {
	// try {
	// String queryString = "select ue from UserEpisode ue where ue.episode_id =
	// :id";
	// UserEpisode ue = em.createQuery(queryString,
	// UserEpisode.class).setParameter("episodeId", id).getSingleResult();
	// return ue;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return null;
	// }
	// }

	@Override
	public User createUser(User user) {
		try {
			em.persist(user);
			em.flush();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public UserEpisode watchEpisode(UserEpisode ue) {
		try {
			// if (ue.getWatched() == 0) {
			// ue.setWatched(1);
			// } else if (ue.getWatched() == 1) {
			// ue.setWatched(0);
			// }

			User user = em.find(User.class, ue.getUser().getId());
			Map<Integer, UserEpisode> m = user.getUserEpisodes();
			if (m.containsKey(ue.getEpisode().getId())) {
				m.replace(ue.getEpisode().getId(), ue);
			}

			em.persist(ue);
			em.flush();
			return ue;
			// return user.getUserEpisodes().get(ue.getEpisode().getId());
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> getAllShows() {
		String queryString = "SELECT tvs FROM TVShow tvs";
		try {
			List<TVShow> tvShows = em.createQuery(queryString, TVShow.class).getResultList();
			// System.out.println(results);
			return tvShows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	// SPLIT UP WORK HERE!!

	@Override
	public List<TVShow> getUserShows(int userId) {
		String queryString = "SELECT u FROM User u WHERE id = :id";
		try {
			User user = em.createQuery(queryString, User.class).setParameter("id", userId).getSingleResult();
			List<TVShow> userShows = user.getTvShows();
			// System.out.println(results);
			return userShows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> addUserShow(int userId, int showId) {
		User user = getUserByUserId(userId);
		List<TVShow> tvShows = user.getTvShows();
		String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
		try {
			TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", showId).getSingleResult();
			tvShows.add(tvs);
			user.setTvShows(tvShows);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> addMultipleUserShows(int userId, int... showIds) {
		try {
			User user = getUserByUserId(userId);
			List<TVShow> tvShows = user.getTvShows();
			for (int i : showIds) {
				TVShow tvs = em.find(TVShow.class, i);
				tvShows.add(tvs);
			}
			user.setTvShows(tvShows);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removeUserShow(int userId, int showId) {
		try {
			TVShow tvs = em.find(TVShow.class, showId);
			User user = getUserByUserId(userId);
			List<TVShow> tvShows = user.getTvShows();
			tvShows.remove(tvs);
			user.setTvShows(tvShows);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removeMultipleUserShows(int userId, Integer... showIds) {
		try {

			User user = getUserByUserId(userId);
			List<TVShow> tvShows = user.getTvShows();
			for (int i : showIds) {
				TVShow tvs = em.find(TVShow.class, i);
				tvShows.remove(tvs);
			}
			user.setTvShows(tvShows);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party addParty(Party party) {
		try {
			em.persist(party);
			em.flush();
			// System.out.println(party);
			return party;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party addUsersToParty(int partyId, Integer... userIds) {
		try {
			Party party = em.find(Party.class, partyId);
			if (party == null) {
				return null;
			} else {
				int pSize = party.getUsers().size();
				if (pSize == 0) {
					party.setUsers(new ArrayList<User>());
				}
				List<User> users = party.getUsers();
				for (int i : userIds) {
					User user = em.find(User.class, i);
					users.add(user);
				}
				party.setUsers(users);
			}
			em.persist(party);
			em.flush();
			return party;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Boolean deleteParty(int partyId, int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean deleteParty(int partyId) {
		try {
			String queryString = "DELETE FROM PartyUser pu WHERE pu.partyId = :id";
			int i = em.createQuery(queryString).setParameter("id", partyId).executeUpdate();
			queryString = "DELETE FROM PartyTVShow pts WHERE pts.partyId = :id";
			int j = em.createQuery(queryString).setParameter("id", partyId).executeUpdate();
			queryString = "DELETE FROM Party p WHERE p.id = :id";
			int k = em.createQuery(queryString).setParameter("id", partyId).executeUpdate();
			em.flush();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Party> getAllParties() {
		try {
			String queryString = "SELECT p FROM Party p";
			List<Party> parties = em.createQuery(queryString, Party.class).getResultList();

			return parties;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Party removeUsersFromParty(int partyId, Integer... userIds) {
		try {
			Party party = em.find(Party.class, partyId);
			List<User> users = party.getUsers();
			List<User> users2 = party.getUsers();
			for (User user : users2) {
				for (int id : userIds) {
					if (user.getId() == id) {
						users.remove(user);
					}
				}
			}
			party.setUsers(users);
			em.persist(party);
			em.flush();
			return party;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> cleanUserTVShows(int userId) {
		try {
			List<TVShow> badList = em.find(User.class, userId).getTvShows();
			List<TVShow> goodList = new ArrayList<>();
			for (TVShow tvShow : badList) {
				if (!goodList.contains(tvShow)) {
					goodList.add(tvShow);
				}
			}
			return goodList;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updateSeason(Integer userId, Integer seasonId, Integer... watchedEpisodes) {
		Season season = em.find(Season.class, seasonId);
		User user = em.find(User.class, userId);
		List<Episode> episodes = season.getEpisodes();
		Map<Integer, UserEpisode> userEpisodes = user.getUserEpisodes();

		List<Integer> we = new ArrayList<>();

		for (int i : watchedEpisodes) {
			we.add(i);
		}

		for (Episode e : episodes) {
			if (we.contains(e.getId())) {
				if (userEpisodes.containsKey(e.getId())) {
					userEpisodes.get(e.getId()).setWatched(1);
				}
				UserEpisode ue = new UserEpisode();
				ue.setWatched(1);
				ue.setUser(user);
				ue.setEpisode(e);
				userEpisodes.put(e.getId(), ue);
			} else if (userEpisodes.containsKey(e.getId())) {
				userEpisodes.get(e.getId()).setWatched(0);
			}
		}
		em.persist(user);

	}

	@Override
	public List<Party> loadUserParties(int userId) {
		try {
			User user = em.find(User.class, userId);
			String queryString = "SELECT p FROM Party p";

			List<Party> allParties = em.createQuery(queryString, Party.class).setParameter("id", userId)
					.getResultList();

			List<Party> parties = new ArrayList<>();
			for (Party p : parties) {
				if (p.getUsers().contains(user)) {
					parties.add(p);
				}
			}
			user.setParties(parties);
			em.persist(user);
			em.flush();
			return parties;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removePartyShows(Integer partyId, Integer... tvShowIds) {
		try {

			Party party = getPartyById(partyId);
			List<TVShow> tvShows = party.getTvShows();
			for (int i : tvShowIds) {
				TVShow tvs = em.find(TVShow.class, i);
				tvShows.remove(tvs);
			}
			party.setTvShows(tvShows);
			em.persist(party);
			em.flush();
			return party.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> addTVShowsToParty(int partyId, Integer... showIds) {
		try {
			Party party = getPartyById(partyId);
			List<TVShow> tvShows = party.getTvShows();

			for (int i : showIds) {
				TVShow tvs = em.find(TVShow.class, i);
				tvShows.add(tvs);
			}
			party.setTvShows(tvShows);
			em.persist(party);
			em.flush();
			return party.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Map<Integer, Integer> buildEpisodeWatchMap(Integer userId, Integer partyId) {
		try {
			Party party = getPartyById(partyId);

			if (party.getUsers().size() == 2) {
				User userA = null;
				User userB = null;
				if (party.getUsers().get(0).getId() == userId) {
					userA = party.getUsers().get(0);
					userB = party.getUsers().get(1);
				} else {
					userA = party.getUsers().get(1);
					userB = party.getUsers().get(0);
				}

				Map<Integer, UserEpisode> userAList = userA.getUserEpisodes();
				Map<Integer, UserEpisode> userBList = userB.getUserEpisodes();
				Map<Integer, Integer> watchMap = new HashMap<>();

				List<TVShow> tvShows = party.getTvShows();

				for (TVShow tvs : tvShows) {
					List<Season> seasons = tvs.getSeasons();
					for (Season season : seasons) {
						List<Episode> episodes = season.getEpisodes();
						for (Episode e : episodes) {
							int i = 0;
							UserEpisode ueA = userAList.get(e.getId());
							UserEpisode ueB = userBList.get(e.getId());

							if (ueA != null) {
								i += (ueA.getWatched() * 2);
							}
							if (ueB != null) {
								i += ueB.getWatched();
							}
							watchMap.put(e.getId(), i);
						}
					}
				}
				return watchMap;
			} else {
				User userA = getUserByUserId(userId);
				Map<Integer, UserEpisode> userAList = userA.getUserEpisodes();
				Map<Integer, Integer> watchMap = new HashMap<>();
				List<TVShow> tvShows = party.getTvShows();

				for (TVShow tvs : tvShows) {
					List<Season> seasons = tvs.getSeasons();
					for (Season season : seasons) {
						List<Episode> episodes = season.getEpisodes();
						for (Episode e : episodes) {
							int i = 0;
							UserEpisode ue = userAList.get(e.getId());
							if (ue != null) {
								i += ue.getWatched();
							}
							watchMap.put(e.getId(), i);
						}
					}
				}
				return watchMap;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
