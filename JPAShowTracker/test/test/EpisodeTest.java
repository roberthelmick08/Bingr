package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Episode;

public class EpisodeTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private Episode episode = null;
	
	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("ShowTracker");
		em = emf.createEntityManager();
		episode = em.find(Episode.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_episode_mapping() {
		assertNotNull(episode);
		assertEquals(1, episode.getId());
		assertEquals(1, episode.getEpisodeNumber());
		assertEquals("Ep 1 GOS", episode.getTitle());
		assertEquals("Episode 1", episode.getDescription());
	}
}
