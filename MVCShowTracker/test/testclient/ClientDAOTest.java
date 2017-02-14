package testclient;

import static org.junit.Assert.*;

import java.util.List;

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

import data.ClientDAO;
import entities.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class ClientDAOTest {

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private ClientDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (ClientDAO) wac.getBean("ClientDAOBean");
	}

	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}

	@Test
	public void Test_Get_User_by_Username_Password() {
		User user = dao.getUser("Chaz", "chaz");
		assertNotNull(user);
		assertEquals("Chaaaz", user.getDisplayName());
	}
	
	@Test
	public void Test_Get_User_by_Id() {
		User user = dao.getUserByUserId(1);
		assertNotNull(user);
		assertEquals("Chaaaz", user.getDisplayName());
	}
	@Test
	public void test_get_all_shows() {
		List<TVShow> tvs = dao.getAllShows();
		assertNotNull(tvs);
		assertEquals(2, tvs.size());
		assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		
	}
	
	@Test
	public void test_get_user_shows() {
		List<TVShow> tvs = dao.getUserShows(1);
		assertNotNull(tvs);
		assertEquals(2, tvs.size());
		assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		assertEquals("Stranger Thrones", tvs.get(1).getTitle());
		
	}
	
	@Test
	public void test_add_user_show() {
		List<TVShow> tvs = dao.getUserShows(2);
		assertNotNull(tvs);
		assertEquals(1, tvs.size());
		//assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		dao.addUserShow(2, 2);
		assertEquals(2, tvs.size());
		assertEquals("Stranger Thrones", tvs.get(1).getTitle());
		
	}
	@Test
	public void test_add_multiple_user_shows() {
		List<TVShow> tvs = dao.getUserShows(3);
		assertNotNull(tvs);
		assertEquals(0, tvs.size());
		//assertEquals("Season 1", tvs.get(0).getSeasons().get(0).getTitle());
		dao.addMultipleUserShows(3, 1, 2);
		assertEquals(2, tvs.size());
		assertEquals("Stranger Thrones", tvs.get(1).getTitle());
		
	}
		@Test
		public void test_remove_user_show() {
			List<TVShow> tvs = dao.getUserShows(1);
			assertNotNull(tvs);
			assertEquals(2, tvs.size());
			assertEquals("Stranger Thrones", tvs.get(1).getTitle());
			dao.removeUserShow(1, 1);
			assertEquals(1, tvs.size());
			assertEquals("Stranger Thrones", tvs.get(0).getTitle());
		}
		
		@Test
		public void test_remove_multiple_user_shows() {
			List<TVShow> tvs = dao.getUserShows(1);
			assertNotNull(tvs);
			assertEquals(2, tvs.size());
			assertEquals("Stranger Thrones", tvs.get(1).getTitle());
			dao.removeMultipleUserShows(1, 1, 2);
			assertEquals(0, tvs.size());
			//assertEquals("Stranger Thrones", tvs.get(0).getTitle());
		}
		@Test
		public void test_addParty_method(){
			Party party = new Party();
			party.setName("Test Party");
			party = dao.addParty(party);
			assertNotNull(party);
		}
		@Test
		public void test_addUsersToParty_Method(){
			Party party = new Party();
			party.setName("Test Party");
			party = dao.addParty(party);
			party = em.find(Party.class, party.getId());
//			party = dao.addUsersToParty(party.getId(), 1, 2);
			User user = em.find(User.class, 1);
			party = dao.addUsersToParty(party.getId(), user.getId());
			assertNotNull(party);
//			System.out.println(party);
			assertEquals(1, party.getUsers().size());
			//assertNotNull(em.find(Party.class, party.getId()));
			//party = em.find(Party.class, party.getId());
			//assertEquals("Chaaaz", party.getUsers().get(0).getDisplayName());
		
		}
		@Test
		public void test_deleteParty_Method(){
			Party party = new Party();
			party.setName("Test Party");
			party = dao.addParty(party);
			assertNotNull(party);
			int partyId = party.getId();
			assertNotNull(em.find(Party.class, partyId));
			assertTrue(dao.deleteParty(partyId));
			assertNull(em.find(Party.class, partyId));
		}
		
		@Test
		public void test_get_all_parties(){
//			Party party = new Party();
//			party.setName("Test Party");
////			
//			System.out.println(party.getId());
//			party = dao.addParty(party);
//			//System.out.println(party.getId());
//			party = dao.addUsersToParty(party.getId(), 1, 2);
//			System.out.println("Party ID: " + party.getId());
////			party.setName("Test Party2");
//			//party = em.find(Party.class, party.getId());
//			System.out.println(party);
////			party = dao.addParty(party);
////			dao.addUsersToParty(party.getId(), 3, 4);
//		//	System.out.println(dao.getAllParties());
//			//System.out.println(dao.getAllParties().get(0).getUsers().get(0).getDisplayName());
//			//System.out.println(party.getUsers().get(0).getDisplayName());
//			//assertEquals(2, dao.getAllParties().size());
//			//assertEquals("Chaz", party.getUsers().get(0).getDisplayName());

		}
		
		
		@Test
		public void test_remove_UsersFromParty_Method(){
			Party party = new Party();
			party.setName("Test Party");
			party = dao.addParty(party);
			int partyId = party.getId();
			party = dao.addUsersToParty(party.getId(), 1, 2);
			assertNotNull(party);
			assertEquals(2, party.getUsers().size());
			dao.removeUsersFromParty(partyId, 1);
			assertEquals(1, party.getUsers().size());
			dao.removeUsersFromParty(partyId, 2);
			assertEquals(0, party.getUsers().size());
			
		}
			
}
