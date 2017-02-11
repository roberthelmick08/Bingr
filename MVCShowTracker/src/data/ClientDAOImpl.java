package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
			User user = em.createQuery(queryString, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
			System.out.println(user);
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
			System.out.println(user);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

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
//			if (ue.getWatched() == 0) {
//				ue.setWatched(1);
//			} else if (ue.getWatched() == 1) {
//				ue.setWatched(0);
//			}
			em.persist(ue);
			em.flush();
			System.out.println(ue);
			return ue;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<TVShow> getAllShows() {
		// TODO Auto-generated method stub
		return null;
	}
	// SPLIT UP WORK HERE!!

	@Override
	public List<TVShow> getUserShows(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TVShow> addUserShow(int userId, int showId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TVShow> addMultipleUserShows(int userId, int... showIds) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TVShow> removeUserShow(int userId, int showId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TVShow> removeMultipleUserShows(int userId, int... showIds) {
		// TODO Auto-generated method stub
		return null;
	}

}
