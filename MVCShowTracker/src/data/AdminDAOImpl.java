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

}
