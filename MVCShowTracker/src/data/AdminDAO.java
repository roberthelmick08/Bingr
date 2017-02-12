package data;

import entities.Episode;
import entities.Season;
import entities.TVShow;

public interface AdminDAO {
	TVShow addTVShow(TVShow tvShow);
	
	Season addSeason(Integer tvShowId, Season season);
	
	Episode addEpisode(Integer seasonId, Episode episode);
	
	boolean removeTVShow(int id);
	
	boolean removeSeason(int id);
	
	boolean removeEpisode(int id);
}
