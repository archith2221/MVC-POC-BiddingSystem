package com.bidding.beans;

import org.springframework.beans.factory.annotation.Autowired;

public class Order {

	@Autowired
	Product product;
	
	
	private String name;
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

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
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
	
	}
