package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Episode;
import entities.Season;
import entities.TVShow;

@Transactional
@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public TVShow addTVShow(TVShow tvShow) {
		try {
			em.persist(tvShow);
			em.flush();
			return tvShow;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Season addSeason(Integer tvShowId, Season season) {
		season.setTvShow(getTVShowById(tvShowId));
		try {
			em.persist(season);
			em.flush();
			return season;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Episode addEpisode(Integer seasonId, Episode episode) {
		episode.setSeason(getSeasonById(seasonId));
		try {
			em.persist(episode);
			em.flush();
			return episode;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public boolean removeTVShow(int id) {
		try {
			TVShow s = em.find(TVShow.class, id);

			em.remove(s);

			return true;

		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean removeSeason(int id) {
		try {
			Season s = em.find(Season.class, id);

			em.remove(s);

			return true;

		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean removeEpisode(int id) {
		try {
			Episode e = em.find(Episode.class, id);

			em.remove(e);

			return true;

		} catch (Exception e) {
			return false;
		}
	}
	
	public TVShow getTVShowById(int tvShowId) {
		try {
			String queryString = "SELECT tvs FROM TVShow tvs WHERE tvs.id = :id";
			TVShow tvShow = em.createQuery(queryString, TVShow.class).setParameter("id", tvShowId).getSingleResult();
			return tvShow;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Season getSeasonById(int seasonId) {
		try {
			String queryString = "SELECT s FROM Season s WHERE s.id = :id";
			Season season = em.createQuery(queryString, Season.class).setParameter("id", seasonId).getSingleResult();
			return season;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Episode getEpisodeById(int episodeId) {
		try {
			String queryString = "SELECT e FROM Episode e WHERE e.id = :id";
			Episode episode = em.createQuery(queryString, Episode.class).setParameter("id", episodeId).getSingleResult();
			return episode;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public TVShow updateTVShow(int id, TVShow tvShow) {
		try {
			TVShow tvShow1 = em.find(TVShow.class, id);
			tvShow1.setTitle(tvShow.getTitle());
			tvShow1.setDescription(tvShow.getDescription());
			tvShow1.setImgUrl(tvShow.getImgUrl());
			em.flush();
			return tvShow1;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Season updateSeason(int id, Season season) {
		try {
			Season season1 = em.find(Season.class, id);
			season1.setTitle(season.getTitle());
			season1.setDescription(season.getDescription());
			season1.setImgUrl(season.getImgUrl());
			em.flush();
			return season1;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Episode updateEpisode(int id, Episode episode) {
		try {
			Episode episode1 = em.find(Episode.class, id);
			episode1.setTitle(episode.getTitle());
			episode1.setDescription(episode.getDescription());
			episode1.setImgUrl(episode.getImgUrl());
			em.flush();
			return episode1;
		} catch (Exception e) {
			return null;
		}
	}

}
