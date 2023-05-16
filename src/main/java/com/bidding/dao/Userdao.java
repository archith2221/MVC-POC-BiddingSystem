package com.bidding.dao;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.bidding.beans.User;

public class Userdao {

JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
	
	public User getUserByEmailforReg(User user) {
	    String sql = "SELECT * FROM User WHERE email = ?";
	    try {
	        return template.queryForObject(sql, new Object[]{user.getEmail()},
	                BeanPropertyRowMapper.newInstance(User.class));
	    } catch (EmptyResultDataAccessException e) {
	        return null;
	    }
	}
	public int adduser(User u) {
		
		String sql="insert into User(name,email,password,role) values('"+u.getName()+"','"+u.getEmail()+"','"+u.getPassword()+"','"+u.getRole()+"')";
		return template.update(sql);
		
	}

	


	
	public User getUserByEmailAndPassword(User user) {
		String sql = "SELECT * FROM User WHERE email = ? AND password = ?";
		return template.queryForObject(sql, new Object[] { user.getEmail(), user.getPassword() },
				BeanPropertyRowMapper.newInstance(User.class));
	}
}
