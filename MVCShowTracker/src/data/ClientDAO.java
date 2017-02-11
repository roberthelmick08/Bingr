package data;

import java.util.List;

import entities.TVShow;
import entities.User;
import entities.UserEpisode;

public interface ClientDAO {
	
	User getUser(String username, String password);
	
	User getUserByUserId(int id);
	
	User createUser(User user);
	
	UserEpisode watchEpisode(UserEpisode ue);
	
	List<TVShow> getAllShows();
	
	List<TVShow> getUserShows(int userId);
	
	List<TVShow> addUserShow(int userId, int showId);

	List<TVShow> addMultipleUserShows(int userId, int... showIds);
	
	List<TVShow> removeUserShow(int userId, int showId);

	List<TVShow> removeMultipleUserShows(int userId, int... showIds);
}
