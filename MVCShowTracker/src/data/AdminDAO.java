package data;

import entities.Episode;
import entities.Season;
import entities.TVShow;

public interface AdminDAO {
	boolean addTVShow(TVShow tvShow);
	
	boolean addSeason(TVShow tvShow, Season season);
	
	boolean addEpisode(TVShow tvShow, Season season, Episode episode);
	
	boolean removeTVShow(TVShow tvShow);
	
	boolean removeSeason(TVShow tvShow, Season season);
	
	boolean removeEpisode(TVShow tvShow, Season season, Episode episode);
}
