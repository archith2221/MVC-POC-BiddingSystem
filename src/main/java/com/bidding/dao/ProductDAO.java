package com.bidding.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bidding.beans.Product;

public class ProductDAO {
	JdbcTemplate template;

	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	
	
  	public int save(Product p) {
		String sql = "insert into Product(name,details,price,activated) values('" + p.getName() + "','" + p.getDetails()
				+ "', '" + p.getPrice() + "','" +  (p.isActivated() ? 1:0) + "')";

		return template.update(sql);
	}
  	
  	

	public int update(Product p) {
//		String sql = "update Product set name='" + p.getName() + "', details=" + p.getDetails() + ",price="
//				+ p.getPrice() + ",activated='" + p.isActivated() + "' where id=" + p.getId() + "";
		String sql = "update Product set name='" + p.getName() + "', details='" + p.getDetails() + "', price='"
				+ p.getPrice() + "',activated='" + (p.isActivated() ? 1:0) + "' where id=" + p.getId() + "";
   
		return template.update(sql);
	}
	
	
   public int delete(int id) {
		String sql = "delete from Product where id=" + id + "";
		return template.update(sql);
	}

	public Product getProductById(int id) {
		String sql = "select * from Product where id=?";
		return template.queryForObject(sql, new Object[] { id }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getProducts() {
		return template.query("select * from Product", new RowMapper<Product>() {
			public Product mapRow(ResultSet rs, int row) throws SQLException {
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDetails(rs.getString(3));
				p.setPrice(rs.getFloat(4));
				p.setActivated(rs.getBoolean(5));
				return p;
			}
		});
		
		
	}
	public List<Product> getcustProducts() {
		return  template.query("select * from product where activated = 1",new  RowMapper<Product>() {

			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Product p = new Product();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setDetails(rs.getString(3));
				p.setPrice(rs.getFloat(4));
					
				
				return p;
			}
			
		});
	}

	

	
}