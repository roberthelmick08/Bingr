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
public class ClientDAOImpl implements ClientDAO{
	@PersistenceContext 
	private EntityManager em;

	@Override
	public User getUser(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	

	@Override
	public User getUserByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User createUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserEpisode watchEpisode(UserEpisode ue) {
		// TODO Auto-generated method stub
		return null;
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
