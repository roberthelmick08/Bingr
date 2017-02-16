package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="party_tv_show")
public class PartyTVShow {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="tv_show_id")
	private int tvShowId;
	
	@Column(name="party_id")
	private int partyId;

	public int getId() {
		return id;
	}

	public int getTvShowId() {
		return tvShowId;
	}

	public void setTvShowId(int tvShowId) {
		this.tvShowId = tvShowId;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
}
