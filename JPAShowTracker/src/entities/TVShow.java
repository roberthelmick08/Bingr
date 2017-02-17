package entities;

import java.util.ArrayList;
import java.util.Collections;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tv_show")
public class TVShow  implements HasID{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="description")
	private String description;
	
	@Column(name="img_url")
	private String imgUrl;
	
	@OneToMany(mappedBy="tvShow", cascade={CascadeType.PERSIST, CascadeType.REMOVE}, fetch=FetchType.EAGER)
	private Set<Season> seasons;

//	@ManyToMany(mappedBy="tvShows")
//	private List<User> users;
	
	@OneToMany(mappedBy="tvShow", cascade={CascadeType.REMOVE})
	private List<UserShow> userShows;
	
	public List<UserShow> getUserShows() {
		return userShows;
	}

	public void setUserShows(List<UserShow> userShows) {
		this.userShows = userShows;
	}

	public void setId(int id) {
		this.id = id;
	}

	// Getters and Setters
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
	
	public List<Season> getSeasons() {
		List<Season> s = new ArrayList<>();
		for (Season season : seasons) {
			s.add(season);
		}
		Collections.sort(s, (a,b) -> a.getSeasonNumber() - b.getSeasonNumber());
		return s;
	}

	public void setSeasons(List<Season> s) {
		seasons = new HashSet<>();
		for (Season season : s) {
			seasons.add(season);
		}
	}
	
	// toString
	@Override
	public String toString() {
		return "Show ["
				+ "id=" + id 
				+ ", title=" + title 
				+ "]";
	}
	
}
