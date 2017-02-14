package entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="party_tv_show")
public class PartyTVShow {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="party_id")
	private Party party;
	
	@ManyToOne
	@JoinColumn(name="tv_show_id")
	private TVShow tvShow;

	public int getId() {
		return id;
	}

	public Party getParty() {
		return party;
	}

	public void setParty(Party party) {
		this.party = party;
	}

	public TVShow getTvShow() {
		return tvShow;
	}

	public void setTvShow(TVShow tvShow) {
		this.tvShow = tvShow;
	}
	
	
}
