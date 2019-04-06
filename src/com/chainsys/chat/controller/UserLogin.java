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

import com.chainsys.chat.dao.MessageDAO;
import com.chainsys.chat.dao.UserDAO;
import com.chainsys.chat.model.Timeline;
import com.chainsys.chat.model.User;
import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;

/**
 * Servlet implementation class UserLogin
 */
@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
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
		User user=new User();
		user.setUname(request.getParameter("uname"));
		user.setPassword(request.getParameter("password"));
	      UserDAO obj=new UserDAO();
	      MessageDAO obj2=new MessageDAO();
	      try {
			if(obj.validateCredentials(user))
			  {
				 HttpSession session=request.getSession();  
			     session.setAttribute("uname",user.getUname());  
			     obj.setStatus("Online",user.getUname());
			     obj2.setLastSeenOffline(user.getUname(),"Online");
			     List<Timeline> list=new ArrayList<Timeline>();
			     List<Timeline> list2=new ArrayList<Timeline>();
			    list=obj.displayTimeline(user.getUname());
			    list2=obj.displayUnlikeposts(user.getUname());
			    list.addAll(list2);
			    
			    
			     if(list.isEmpty())
			     {
			    	 request.setAttribute("noposts","You have no new posts!!!");
			     }
			    
				 request.setAttribute("list", list);
				 RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
				 rd.forward(request,response);			     
			   
			  }
			  else
			  {
				 RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
				 request.setAttribute("error","Invalid username or password!!!");
				 request.setAttribute("button","&times");
				 rd.forward(request,response);
				  
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
	}

}
