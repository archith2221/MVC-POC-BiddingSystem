package com.bidding.beans;

import org.springframework.beans.factory.annotation.Autowired;

public class Order {
	@Autowired
	String pro;
	
	public String getPro() {
		return pro;
	}
	public void setPro(String string) {
		this.pro = string;
	}
	private int orderid;
	
	private float bidprice;
	private int id;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
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
