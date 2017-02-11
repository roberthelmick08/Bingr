package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.UserEpisode;

public class UserEpisodeTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private UserEpisode userEpisode = null;
	
	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("ShowTracker");
		em = emf.createEntityManager();
		userEpisode = em.find(UserEpisode.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_episode_mapping() {
		// assertNotNull(userEpisode);
	}
}
