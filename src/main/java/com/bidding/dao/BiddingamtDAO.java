package com.bidding.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bidding.beans.Biddamount;
import com.bidding.beans.Product;

public class BiddingamtDAO {
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	public Product getProductById(int bidid) {
		String sql = "select * from Product where id=?";
		return template.queryForObject(sql, new Object[] { bidid }, new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	

	public int newbid(Biddamount b) {
	String sql ="insert into Bid(bidprice,id,bidaccepted) values('" + b.getBidprice() +"','" + b.getId() +"','" +  (b.isBidAccepted() ? 1:0) +"')";
	return template.update(sql);
	}


	public List<Biddamount> getbidaccepted() {
	
		return template.query("Select * from Bid where bidaccepted = 1", new RowMapper<Biddamount>() {

			@Override
			public Biddamount mapRow(ResultSet rs, int rowNum) throws SQLException {
				Biddamount n=new Biddamount();
				n.setBidid(rs.getInt(1));
				n.setBidprice(rs.getFloat(2));
				n.setId(rs.getInt(3));
				
				return n;
			}
			
		});
	}

           public List<Biddamount> getbitnotaccepted() {
		     
		        return template.query("Select * from Bid where bidaccepted=0", new RowMapper<Biddamount>() {

					@Override
					public Biddamount mapRow(ResultSet rs, int rowNum) throws SQLException {
					Biddamount s= new Biddamount();
					s.setBidid(rs.getInt(1));
					s.setBidprice(rs.getFloat(2));
					s.setId(rs.getInt(3));
					
						return s;
					}
		        	
		        });
	      }

	public Biddamount getBidProductBybidId(int id) {
	String sql="select * from bid where bidid=?";
		return  template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Biddamount>(Biddamount.class));
	}
	

	public int bidupdate(Biddamount b) {
		  System.out.println("BidAccepted value: " + b.isBidAccepted());
		String sql = "update Bid set bidaccepted='" + (b.isBidAccepted() ? 1:0) + "' where bidid='" + b.getBidid() + "'";

		return template.update(sql);
		
	}
	
	public List<Biddamount> getbidProducts() {
		return template.query("select * from bid", new RowMapper<Biddamount>() {
			public Biddamount mapRow(ResultSet rs, int row) throws SQLException {
				Biddamount b = new Biddamount();
				b.setBidid(rs.getInt(1));
				b.setBidprice(rs.getFloat(2));
				b.setId(rs.getInt(3));
				b.setBidAccepted(rs.getBoolean(4));
				return b;
			}
		});
		
		
	}
	

	public int deletebid(int id) {
		String sql="delete from Bid where bidid=" +id+ "";
		return template.update(sql);
	}


	


	

	
	}
