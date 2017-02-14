package entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
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

	@ManyToMany
	@JoinTable(name = "party_tv_show", joinColumns = @JoinColumn(name = "party_id"), 
	inverseJoinColumns = @JoinColumn(name = "tv_show_id"))
	List<TVShow> tvShows;

	@ManyToMany(cascade={CascadeType.ALL})
	@JoinTable(name = "party_user", joinColumns = @JoinColumn(name = "party_id"), 
	inverseJoinColumns = @JoinColumn(name = "user_id"))
	List<User> users;

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
		return tvShows;
	}

	public void setTvShows(List<TVShow> tvShows) {
		this.tvShows = tvShows;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
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
