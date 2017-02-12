package testadmin;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import data.AdminDAO;
import entities.Episode;
import entities.Season;
import entities.TVShow;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class AdminDAOTest {
	
	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private AdminDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (AdminDAO) wac.getBean("AdminDAOBean");
	}
	
	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}
	
	@Test
	public void test_addTVShow_adds_show() {
		TVShow tvShow = new TVShow();
		tvShow.setTitle("New Show");
		tvShow.setDescription("Its so new!");
		
		TVShow newShow = dao.addTVShow(tvShow);
		assertNotNull(newShow);
		assertEquals("New Show", newShow.getTitle());
		assertEquals("Its so new!", newShow.getDescription());
	}
	
	@Test
	public void test_addSeason_adds_season() {
		Season season = new Season();
		season.setTitle("New Season");
		season.setDescription("All New!");
		
		Season newSeason = dao.addSeason(1, season);
		assertNotNull(newSeason);
		assertEquals("New Season", newSeason.getTitle());
		assertEquals("All New!", newSeason.getDescription());
		assertEquals(1, newSeason.getTvShow().getId());
	}

	@Test
	public void test_addEpisode_adds_episode() {
		Episode episode = new Episode();
		episode.setEpisodeNumber(1);
		episode.setTitle("New 1");
		episode.setDescription("New Episode");
		
		Episode newEpisode = dao.addEpisode(4, episode);
		assertNotNull(newEpisode);
		assertEquals(1, newEpisode.getEpisodeNumber());
		assertEquals("New 1", newEpisode.getTitle());
		assertEquals("New Episode", newEpisode.getDescription());
		assertEquals(4, newEpisode.getSeason().getId());
	}
	
	@Test
	public void test_removeTVShow_removes_show() {
		TVShow tvShow = new TVShow();
		tvShow.setTitle("New Show");
		tvShow.setDescription("Its so new!");
		
		TVShow newShow = dao.addTVShow(tvShow);
		assertNotNull(newShow);
		assertTrue(dao.removeTVShow(newShow.getId()));
	}
	
	@Test
	public void test_removeSeason_removes_season() {
		Season season = new Season();
		season.setTitle("New Season");
		season.setDescription("All New!");
		
		Season newSeason = dao.addSeason(1, season);
		assertNotNull(newSeason);
		assertTrue(dao.removeSeason(season.getId()));
	}
	
	@Test
	public void test_removeEpisode_removes_episode() {
		Episode episode = new Episode();
		episode.setEpisodeNumber(1);
		episode.setTitle("New 1");
		episode.setDescription("New Episode");
		
		Episode newEpisode = dao.addEpisode(4, episode);
		assertNotNull(newEpisode);
		assertTrue(dao.removeEpisode(newEpisode.getId()));
	}
}
