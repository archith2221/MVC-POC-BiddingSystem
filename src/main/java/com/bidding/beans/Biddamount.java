package com.bidding.beans;

import org.springframework.beans.factory.annotation.Autowired;

import com.bidding.dao.ProductDAO;


public class Biddamount {

	private int bidid;
    private int uid;
	private float bidprice;
    private int id;
    public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	private boolean bidAccepted ;
    
    
	
	public boolean isBidAccepted() {
		return bidAccepted;
	}
	public void setBidAccepted(boolean bidAccepted) {
		this.bidAccepted = bidAccepted;
	}
	public int getBidid() {
		return bidid;
	}
	public void setBidid(int bidid) {
		this.bidid = bidid;
	}
	public float getBidprice() {
		return bidprice;
	}
	public void setBidprice(float bidprice) {
		this.bidprice = bidprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	

	
}
    