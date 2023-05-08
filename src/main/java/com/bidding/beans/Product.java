package com.bidding.beans;

public class Product {

	private int id;
	private String name;
	private String details;
	private float price;
//	private boolean activated;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}
//
//	public boolean isActivated() {
//		return activated;
//	}
//
//	public void setActivated(boolean activated) {
//		this.activated = activated;
//	}

}