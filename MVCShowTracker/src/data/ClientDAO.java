package data;

import java.util.List;

import entities.*;

public interface ClientDAO {
	//Phase I
	User getUser(String username, String password);
	
	User getUserByUserId(int id);
	
	User createUser(User user);
	
	UserEpisode watchEpisode(UserEpisode ue);
	
	List<TVShow> getAllShows();
	
	List<TVShow> cleanUserTVShows(int userId);
	
	List<TVShow> getUserShows(int userId);
	
	List<TVShow> addUserShow(int userId, int showId);

	List<TVShow> addMultipleUserShows(int userId, int... showIds);
	
	List<TVShow> removeUserShow(int userId, int showId);

	List<TVShow> removeMultipleUserShows(int userId, int... showIds);

	void updateSeason(Integer userId, Integer seasonId, Integer[] watchedEpisodes);

	//Phase II

	Party addParty(Party party);
	
	Party addUsersToParty(int partyId, Integer... userIds);
	
	Party removeUsersFromParty(int partyId, Integer... userIds);
	
	Boolean deleteParty(int partyId, int userId);
	
	Boolean deleteParty(int partyId);
	
	List<TVShow> addTVShowsToParty(int partyId, Integer... showIds);
	
	List<Party> getAllParties();	
	
	List<Party> loadUserParties(int userId);	

}
