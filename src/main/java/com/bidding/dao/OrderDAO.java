package com.bidding.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bidding.beans.Biddamount;
import com.bidding.beans.Order;


public class OrderDAO {

	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	public Biddamount getOrderbybidid(int bidid) {
		String sql = "select * from Bid where bidid=?";
		return template.queryForObject(sql, new Object[] { bidid }, new BeanPropertyRowMapper<Biddamount>(Biddamount.class));

	}
		public int bidupdate(Biddamount b) {
		String sql = "update Bid set bidaccepted='" + (b.isBidAccepted() ? 1:0) + "' where bidid='" + b.getBidid() + "'";

		return template.update(sql);
		
	}
		public int neword(Biddamount b) {
			String sql ="insert into Ordertb(payment,id,uid) values('" + b.getBidprice() +"','" + b.getId() +"','"+b.getUid()+"')";
			return template.update(sql);
		
		}
		public List<Order> getOrders(int uid) {
			
			return template.query("SELECT p.name, o.*FROM product p JOIN ordertb o ON p.id = o.id where uid='"+uid+"'", new RowMapper<Order>() {
				public Order mapRow(ResultSet rs, int row) throws SQLException {
					Order o = new Order();
					o.setName(rs.getString(1));
					o.setOrderid(rs.getInt(2));
					o.setBidprice(rs.getFloat(3));
					o.setId(rs.getInt(4));
					o.setUid(rs.getInt(5));
                       	return o;
				}
			});	
			
		}


}
