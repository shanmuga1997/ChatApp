package com.chainsys.chat.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import com.chainsys.chat.model.User;

public class UserDAO {
	
	public void addUser(User user) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="Insert into UserInfo values(?,?,?,?,?)";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,user.getUname());
        prepareStatement.setString(2,user.getFullname());
        prepareStatement.setString(3,user.getGender());
        prepareStatement.setInt(4,user.getAge());
        prepareStatement.setString(5,user.getGmail());
        prepareStatement.execute();
        
        url="insert into UserCredentials values(?,?)";
        prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,user.getUname());
        prepareStatement.setString(2,user.getPassword());
        prepareStatement.execute();
        
        
        url="insert into status values(?,?)";
        prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,user.getUname());
        prepareStatement.setString(2,"Offline");
        prepareStatement.execute();
        
       connection.close();
	}
	
	public boolean checkUsername(User user) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select * from UserCredentials where uname=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,user.getUname());
	    ResultSet result=prepareStatement.executeQuery();
	    if(result.next())
	    {
	    	connection.close();
	    	return true;
	    }
	    connection.close();
	    return false;
   	}
	public boolean validateCredentials(User user) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select * from UserCredentials where uname=? and password=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,user.getUname());
		prepareStatement.setString(2,user.getPassword());
	    ResultSet result=prepareStatement.executeQuery();
	    if(result.next())
	    {
	    	connection.close();
	    	return true;
	    }
	    connection.close();
	    return false;
	}
	
	public void setStatus(String status,String uname) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="update status set lastseen=? where uname=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,status);
        prepareStatement.setString(2,uname);
        prepareStatement.execute();
        connection.close();
	     
	}
	public ArrayList<User> DisplayUser(String uname) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select uname,fullname from UserInfo where uname in(select toId from FriendList where fromId=? and status=?)";
		PreparedStatement prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,uname);
		prepareStatement.setString(2,"Request");
	    ResultSet result=prepareStatement.executeQuery();
	    ArrayList<User> list=new ArrayList<User>();
	    User user;
	    while(result.next())
	    {
	    	user=new User();
	    	user.setUname(result.getString(1));
	    	user.setFullname(result.getString(2));
	    	user.setStatus("Requested");
	    	list.add(user);
	    }
		
		
		
		
		
		url="select uname,fullname from UserInfo where uname!=? and uname not in(select toId from FriendList where fromId=?) and uname not in(select fromId from FriendList where toId=?)";
	    prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,uname);
		prepareStatement.setString(2,uname);
		prepareStatement.setString(3,uname);
		//prepareStatement.setString(4,"accepted");
	    result=prepareStatement.executeQuery();
	    while(result.next())
	    {
	    	user=new User();
	    	user.setUname(result.getString(1));
	    	user.setFullname(result.getString(2));
	    	user.setStatus("Send");
	    	list.add(user);
	    	
	    	
	    }
	    connection.close();
	    return list;
	}
	public void sendRequest(String fromId,String toId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="insert into FriendList values(?,?,?)"; 
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,fromId);
        prepareStatement.setString(2,toId);
        prepareStatement.setString(3,"Request");
        prepareStatement.execute();
        connection.close();
       
	     
	}
	public void withdrawRequest(String fromId,String toId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="delete from FriendList where fromId=? and toId=?"; 
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,fromId);
        prepareStatement.setString(2,toId);
        prepareStatement.execute();
        connection.close();
        
	     
	}
	public ArrayList<User> getRequest(String uname) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select fromId from FriendList where toId=? and status=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,uname);
		prepareStatement.setString(2,"Request");
	    ResultSet result=prepareStatement.executeQuery();
	    User user;
	    ArrayList<User> list=new ArrayList<User>();
	    while(result.next())
	    {
	    	user=new User();
	    	user.setUname(result.getString(1));
	    	list.add(user);
	    }
	    connection.close();
	    return list;
	}
	public void acceptRequest(String toId,String fromId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="update FriendList set status=? where fromId=? and toId=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,"accepted");
        prepareStatement.setString(2,fromId);
        prepareStatement.setString(3,toId);
        prepareStatement.execute();
        connection.close();
	     
	}
    public  ArrayList<User >displayFriends(String uname) throws SQLException
    {
    	Connection connection=ConnectionUtil.getConnection();	
		String url="select fromId,toId from FriendList where (fromId=? or toId=? ) and status=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
		prepareStatement.setString(1,uname);
		prepareStatement.setString(2,uname);
		prepareStatement.setString(3,"accepted");
	    ResultSet result=prepareStatement.executeQuery();
	    TreeSet<String> removeDuplicates=new TreeSet<String>();
	    ArrayList<User> list=new ArrayList<User>();
	    User user;
	    while(result.next())
	    {
	    	if(!uname.equalsIgnoreCase(result.getString(1)))
	    	{
	    		if(removeDuplicates.add(result.getString(1)))
	    		{
	    			user=new User();
	    			user.setUname(result.getString(1));
	    			list.add(user);
	    		}
	    		
	    	}
	    	if(!uname.equalsIgnoreCase(result.getString(2)))
	    	{
	    		if(removeDuplicates.add(result.getString(2)))
	    		{
	    			user=new User();
	    			user.setUname(result.getString(2));
	    			list.add(user);
	    		}
	    		
	    	}
	    	
	    }
	    connection.close();
	    return list;	
    }
}
