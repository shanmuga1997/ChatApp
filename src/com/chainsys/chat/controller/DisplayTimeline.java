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
import com.chainsys.chat.model.Timeline;

/**
 * Servlet implementation class DisplayTimeline
 */
@WebServlet("/DisplayTimeline")
public class DisplayTimeline extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayTimeline() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 UserDAO obj=new UserDAO();
		 HttpSession session=request.getSession(false);  
		 String username=(String)session.getAttribute("uname"); 
	     List<Timeline> list=new ArrayList<Timeline>();
	     List<Timeline> list2=new ArrayList<Timeline>();
	     try {
			list=obj.displayTimeline(username);
			  list2=obj.displayUnlikeposts(username);
			     list.addAll(list2);
			    
			    
			     if(list.isEmpty())
			     {
			    	 request.setAttribute("noposts","You have no new posts!!!");
			     }
			    
				 request.setAttribute("list", list);
				 RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
				 rd.forward(request,response);			     
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	   
	   
		
         
         
         
         
	}

}
