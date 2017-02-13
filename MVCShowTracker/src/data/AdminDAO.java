package data;

import entities.Episode;
import entities.Season;
import entities.TVShow;

public interface AdminDAO {
	TVShow addTVShow(TVShow tvShow);
	
	TVShow getTVShowById(int id);
	
	Season addSeason(Integer tvShowId, Season season);
	
	Season getSeasonById(int id);
	
	Episode addEpisode(Integer seasonId, Episode episode);
	
	Episode getEpisodeById(int id);
	
	boolean removeTVShow(int id);
	
	boolean removeSeason(int id);
	
	boolean removeEpisode(int id);
}
