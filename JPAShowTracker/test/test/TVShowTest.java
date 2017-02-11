package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.TVShow;

public class TVShowTest {
	private EntityManagerFactory emf = null;
	private EntityManager em = null;
	private TVShow tvShow = null;
	
	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("ShowTracker");
		em = emf.createEntityManager();
		tvShow = em.find(TVShow.class, 1);
	}
	
	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	public void test_tvShow_mapping() {
		assertNotNull(tvShow);
		assertEquals(1, tvShow.getId());
		assertEquals("Game of Swords", tvShow.getTitle());
		assertEquals("People killing eachother", tvShow.getDescription());
	}
}
