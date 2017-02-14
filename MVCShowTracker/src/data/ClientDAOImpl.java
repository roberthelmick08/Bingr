package data;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Episode;
import entities.Party;
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
		String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
		try {
			TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", showId).getSingleResult();
			User user = getUserByUserId(userId);
			user.getTvShows().add(tvs);
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
			String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
			for (int i : showIds) {
				TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", i).getSingleResult();
				user.getTvShows().add(tvs);
			}
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
		String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
		try {
			TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", showId).getSingleResult();
			User user = getUserByUserId(userId);
			user.getTvShows().remove(tvs);
			em.persist(user);
			em.flush();
			return user.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> removeMultipleUserShows(int userId, int... showIds) {
		try {
			User user = getUserByUserId(userId);
			String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
			for (int i : showIds) {
				TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", i).getSingleResult();
				user.getTvShows().remove(tvs);
			}
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
	public Party addUsersToParty(int partyId, int... userIds) {
		try {
			Party party = em.find(Party.class, partyId);
			if (party == null) {
				return null;
			} else {
				if (party.getUsers() == null) {
					party.setUsers(new ArrayList<User>());
				}
				for (int i : userIds) {
					party.getUsers().add(em.find(User.class, i));
				}
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
			Party party = em.find(Party.class, partyId);
			if (party != null) {
				em.remove(party);
				em.flush();
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<TVShow> addTVShowsToParty(int partyId, int... showIds) {
		try {
			Party party = em.find(Party.class, partyId);
			String queryString = "SELECT tvs FROM TVShow tvs WHERE id = :id";
			for (int i : showIds) {
				TVShow tvs = em.createQuery(queryString, TVShow.class).setParameter("id", i).getSingleResult();
				party.getTvShows().add(tvs);
			}
			em.persist(party);
			em.flush();
			return party.getTvShows();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	public Party removeUsersFromParty(int partyId, int... userIds) {
		try {
			Party party = em.find(Party.class, partyId);
			List<User> users = party.getUsers();
			List<User> users2 = new ArrayList<>();
			users2.addAll(users);
			for (User user : users2) {
				for (int id : userIds) {
					if (user.getId() == id) {
						users.remove(user);
					}
				}
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

}
