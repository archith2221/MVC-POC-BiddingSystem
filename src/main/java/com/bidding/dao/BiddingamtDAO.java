package com.bidding.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bidding.beans.Biddamount;
import com.bidding.beans.Order;
import com.bidding.beans.Product;

public class BiddingamtDAO {
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	public Product getProductById(int bidid) {
		String sql = "select * from Product where id=?";
		return template.queryForObject(sql, new Object[] { bidid  }, new BeanPropertyRowMapper<Product>(Product.class));
	}
	


	public int newbid(Biddamount b) {
	    String sql ="insert into Bid(bidprice,id,bidaccepted,uid) values('" + b.getBidprice() +"','" + b.getId() +"','" +  (b.isBidAccepted() ? 1:0) +"','"+ b.getUid() +"')";
	    return template.update(sql);
	}

		
	public List<Biddamount> getbidaccepted(int uid) {
	    String sql = "Select b.*,p.name From bid b Join product p ON b.id = p.id WHERE bidaccepted = 1 AND uid = ?";
	    return template.query(sql, new Object[] { uid }, new BeanPropertyRowMapper<>(Biddamount.class));
	}
	
	public List<Biddamount> getbitnotaccepted(int uid) {
	    String sql = "SELECT b.*,p.name FROM bid b JOIN product p ON b.id=p.id WHERE bidaccepted = 0 AND uid = ?";
	    return template.query(sql, new Object[] { uid }, new BeanPropertyRowMapper<>(Biddamount.class));
	}
	
	
          

	public Biddamount getBidProductBybidId(int id) {
	String sql="select * from bid where bidid=?";
		return  template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Biddamount>(Biddamount.class));
	}
	

	public int bidupdate(Biddamount b) {

		String sql = "update Bid set bidaccepted='" + (b.isBidAccepted() ? 1:0) + "' where bidid='" + b.getBidid() + "'";

		return template.update(sql);
		
	}
	public String getEmailByUid(int uid) {
	    String sql = "SELECT email FROM user WHERE uid = ?";
	     return template.queryForObject(sql, new Object[] { uid}, String.class);
	
	}

	
	public List<Biddamount> getbidProducts() {
	    return template.query("SELECT b.*, p.name AS product_name, u.email AS user_email FROM bid b JOIN product p ON b.id = p.id JOIN user u ON b.uid = u.uid ORDER BY b.id", new RowMapper<Biddamount>() {
	        public Biddamount mapRow(ResultSet rs, int row) throws SQLException {
	            Biddamount b = new Biddamount();
	            b.setBidid(rs.getInt(1));
	            b.setBidprice(rs.getFloat(2));
	            b.setId(rs.getInt(3));
	            b.setBidAccepted(rs.getBoolean(4));
	            b.setUid(rs.getInt(5));
	            b.setName(rs.getString(6));
	            b.setEmail(rs.getString(7));
	            return b;
	        }
	    });
	}
	


	public int deletebid(int id) {
		String sql="delete from Bid where bidid=" +id+ "";
		return template.update(sql);
	}


	
	}
