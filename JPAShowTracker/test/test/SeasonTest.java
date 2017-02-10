package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Season;

public class SeasonTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private Season season = null;
	
	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("ShowTracker");
		em = emf.createEntityManager();
		season = em.find(Season.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_season_mapping() {
		assertNotNull(season);
		assertEquals(1, season.getId());
		assertEquals(1, season.getSeasonNumber());
		assertEquals("Season 1", season.getTitle());
		assertEquals("Season 1 of Stranger Thrones", season.getDescription());
	}
}
