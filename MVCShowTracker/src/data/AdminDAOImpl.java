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
	public boolean addTVShow(TVShow tvShow) {
		try {
			em.persist(tvShow);
			em.flush();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean addSeason(TVShow tvShow, Season season) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addEpisode(TVShow tvShow, Season season, Episode episode) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeTVShow(TVShow tvShow) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeSeason(TVShow tvShow, Season season) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeEpisode(TVShow tvShow, Season season, Episode episode) {
		// TODO Auto-generated method stub
		return false;
	}

}
