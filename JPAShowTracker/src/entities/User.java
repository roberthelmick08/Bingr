package entities;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "display_name")
	private String displayName;

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "img_url")
	private String imgUrl;

	@ManyToMany(fetch = FetchType.EAGER, cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "user_tv_show", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "tv_show_id"))
	Set<TVShow> tvShows;

	@OneToMany(mappedBy = "user", cascade = { CascadeType.PERSIST }, fetch = FetchType.EAGER)
	@MapKeyColumn(name = "episode_id")
	private Map<Integer, UserEpisode> userEpisodes;

	@ManyToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	Set<Party> parties;

	public void setId(int id) {
		this.id = id;
	}

	// Getters and Setters
	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	// public List<TVShow> getTvShows() {
	// return tvShows;
	// }
	//
	// public void setTvShows(List<TVShow> tvShows) {
	// this.tvShows = tvShows;
	// }

	public Map<Integer, UserEpisode> getUserEpisodes() {
		return userEpisodes;
	}

	public void setUserEpisodes(Map<Integer, UserEpisode> userEpisodes) {
		this.userEpisodes = userEpisodes;
	}

	public int getId() {
		return id;
	}

	public List<Party> getParties() {
		List<Party> tempParties = new ArrayList<>();
		if (parties != null) {
			for (Party p : parties) {
				tempParties.add(p);
			}
		}
		Collections.sort(tempParties, (a, b) -> a.getName().compareToIgnoreCase(b.getName()));
		return tempParties;
	}

	public void setParties(List<Party> parties) {
		this.parties = new HashSet<>();
		if (parties != null) {
			for (Party p : parties) {
				this.parties.add(p);
			}
		}
	}

	public List<TVShow> getTvShows() {
		List<TVShow> tempTVShows = new ArrayList<>();
		if (tvShows != null) {
			for (TVShow tvs : tvShows) {
				tempTVShows.add(tvs);
			}
		}
		Collections.sort(tempTVShows, (a, b) -> a.getTitle().compareToIgnoreCase(b.getTitle()));
		return tempTVShows;
	}

	public void setTvShows(List<TVShow> tvShows) {
		this.tvShows = new HashSet<>();
		if (tvShows != null) {
			for (TVShow tvs : tvShows) {
				this.tvShows.add(tvs);
			}
		}
	}

	// toString
	@Override
	public String toString() {
		return "Id: " + id + " User: " + displayName;
	}

}
