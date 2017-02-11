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
import javax.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	
	@Column(name="display_name")
	private String displayName;
	
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;
	
	@Column(name="img_url")
	private String imgUrl;
	
	@ManyToMany
	@JoinTable(name="user_tv_show",
		joinColumns=@JoinColumn(name="tv_show_id"),
		inverseJoinColumns=@JoinColumn(name="user_id"))
	List<TVShow> tvShows;
	
	@OneToMany(mappedBy="user", cascade={CascadeType.PERSIST, CascadeType.REMOVE})
	private List<UserEpisode> userEpisodes;

	
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

	public int getId() {
		return id;
	}

	// toString
	@Override
	public String toString() {
		return "User: " + displayName;
	}
	
}
