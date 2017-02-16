package entities;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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

@Entity
public class Party {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "party_tv_show", joinColumns = @JoinColumn(name = "party_id"), inverseJoinColumns = @JoinColumn(name = "tv_show_id"))
	Set<TVShow> tvShows;

	@ManyToMany(cascade = { CascadeType.REMOVE, CascadeType.PERSIST }, fetch = FetchType.EAGER)
	@JoinTable(name = "party_user", joinColumns = @JoinColumn(name = "party_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	Set<User> users;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public List<User> getUsers() {
		List<User> tempUsers = new ArrayList<>();
		if (users != null) {
			for (User u : users) {
				tempUsers.add(u);
			}
		}
		Collections.sort(tempUsers, (a, b) -> a.getId() - (b.getId()));
		return tempUsers;
	}

	public void setUsers(List<User> users) {
		this.users = new HashSet<>();
		if (users != null) {
			for (User u : users) {
				this.users.add(u);
			}
		}
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Party [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		if (tvShows != null) {
			builder.append(", tvShows size=");
			builder.append(tvShows.size());
		} else {
			builder.append(", tvShows is null");
		}
		if (users != null) {
			builder.append(", users size=");
			builder.append(users.size());
		} else {
			builder.append(", users is null");
		}
		builder.append("]");
		return builder.toString();
	}

}
