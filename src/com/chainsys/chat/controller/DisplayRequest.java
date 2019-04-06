package com.chainsys.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chainsys.chat.dao.UserDAO;
import com.chainsys.chat.model.User;

/**
 * Servlet implementation class DisplayRequest
 */
@WebServlet("/DisplayRequest")
public class DisplayRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayRequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);  
	    String uname=(String)session.getAttribute("uname"); 
        UserDAO obj=new UserDAO();
        try {
        	List<User> list=obj.getRequest(uname);
			request.setAttribute("list",list);
			String result="";
		    for(User user:list)
		    {
		    	result="<i class='fas fa-angle-double-right' style='font-size:20px;color:darkblue'></i>"+"&nbsp;"+user.getUname()+" has send you a friend request!!!" +"<br>"+"<button type='button' class='accept' onmouseover='changeColour(this)' onmouseout='changeColour(this)'  value="+user.getUname()+" onclick='acceptRequest(this)'>"+"&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;"+"Accept"+"&nbsp;"+"&nbsp;"+"</button>          "+"<button type='button' onmouseover='changeColour(this)' onmouseout='changeColour(this)' class='accept' value="+user.getUname()+" onclick='rejectRequest(this)'>"+"Reject"+"</button>"+"<br><br>"+result;	
		    	
		    }
		    ArrayList<String> notifications=obj.getNotification(uname);
		    for(String str:notifications)
		    {
		    	result="<i class='fas fa-angle-double-right' style='font-size:20px;color:darkblue'></i>"+"&nbsp;"+str+"<br><br>"+result;
		    }
		    
	        if(list.isEmpty() && notifications.isEmpty())
		    {
		    	result="You have no new notifications!!";
		    }
		    out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
      
	}

}
