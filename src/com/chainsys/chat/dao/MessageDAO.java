package com.chainsys.chat.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class MessageDAO {
	public String getMessage(String fromId,String toId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select message from Inbox where fromId=? and toId=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,fromId);
        prepareStatement.setString(2,toId);
   		ResultSet result=prepareStatement.executeQuery();
		String message=" ";
		while(result.next())
		{
			message=result.getString(1);
		}
		connection.close();
		return message;
		
		
	}
	public void InsertMessage(String fromId,String toId,String message)throws SQLException
	{
		String temp=" ";
		Connection connection=ConnectionUtil.getConnection();	
		String url="Insert into Inbox values(?,?,?,?)";
		PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,fromId);
        prepareStatement.setString(2,toId);
        temp="Me"+":"+message;
        prepareStatement.setString(3,temp);
        prepareStatement.setString(4,"Online");
        prepareStatement.execute();
        
      
        url="Insert into Inbox values(?,?,?,?)";
	    prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,toId);
        prepareStatement.setString(2,fromId);
        temp=fromId+":"+message;
        prepareStatement.setString(3,temp);
        prepareStatement.setString(4,"Online");
        prepareStatement.execute();
        connection.close();
	}
	public boolean isEmpty(String fromId,String toId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select * from Inbox where fromId=? and toId=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(1,fromId);
        prepareStatement.setString(2,toId);
       ResultSet result=prepareStatement.executeQuery();
		if(result.next())
		{
			connection.close();
			return false;
		}
		connection.close();
	    return true;
	}
	public void updateMessage(String fromId,String toId,String message) throws SQLException
	{
		String temp=" ";
		if(!isEmpty(fromId,toId))
		{
			
			Connection connection=ConnectionUtil.getConnection();
			String oldMessage=getMessage(fromId,toId);
			String url="update Inbox set message=? where fromId=? and toId=?";
	        PreparedStatement prepareStatement=connection.prepareStatement(url);
	        prepareStatement.setString(2,fromId);
	        prepareStatement.setString(3,toId);
	        temp=oldMessage+"\n"+"Me"+":"+message;
	        prepareStatement.setString(1,temp);
	        prepareStatement.execute();
	        
	        
	        oldMessage=getMessage(toId,fromId);
			url="update Inbox set message=? where fromId=? and toId=?";
	        prepareStatement=connection.prepareStatement(url);
	        prepareStatement.setString(2,toId);
	        prepareStatement.setString(3,fromId);
	        temp=oldMessage+"\n"+fromId+":"+message;
	        prepareStatement.setString(1,temp);
	        prepareStatement.execute();
	        connection.close();
		}
		else
		{
			InsertMessage(fromId,toId,message);
		}
		
		
	}
	public String getLastSeen(String fromId,String toId) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();	
		String url="select lastSeen from Inbox where fromId=? and toId=?";
	    PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(2,fromId);
        prepareStatement.setString(1,toId);
       
   		ResultSet result=prepareStatement.executeQuery();
		String lastSeen=" ";
		while(result.next())
		{
			lastSeen=result.getString(1);
		}
		connection.close();
		return lastSeen;
	}
	public void setLastSeen(String fromId,String toId,String lastseen) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();
		String url="update Inbox set lastSeen=? where fromId=? and toId=?";
        PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(2,fromId);
        prepareStatement.setString(3,toId);
        prepareStatement.setString(1,lastseen);
        prepareStatement.execute();
        connection.close();
	}
	public void setLastSeenOffline(String fromId,String lastseen) throws SQLException
	{
		Connection connection=ConnectionUtil.getConnection();
		String url="update Inbox set lastSeen=? where fromId=?";
        PreparedStatement prepareStatement=connection.prepareStatement(url);
        prepareStatement.setString(2,fromId);
       // prepareStatement.setString(3,fromId);
        prepareStatement.setString(1,lastseen);
        prepareStatement.execute();
        connection.close();
	}
	public static void main(String[] args) throws SQLException {
		MessageDAO o=new MessageDAO();
		o.updateMessage("shanmuga","kavin","hai");
		//o.updateMessage("shanmuga","kavin","hello");
	}

}
