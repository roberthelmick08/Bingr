package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="party_user")
public class PartyUser {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;	

	@Column(name="user_id")
	private int userId;
	
	@Column(name="party_id")
	private int partyId;

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPartyId() {
		return partyId;
	}

	public void setPartyId(int partyId) {
		this.partyId = partyId;
	}
	
	
}
