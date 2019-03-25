package com.chainsys.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * Servlet implementation class DisplayUserBySearch
 */
@WebServlet("/DisplayUserBySearch")
public class DisplayUserBySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayUserBySearch() {
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
		HttpSession session=request.getSession(false);  
        String name=(String)session.getAttribute("uname"); 
        String uname=request.getParameter("uname");
        String fname=request.getParameter("fname");
        UserDAO obj=new UserDAO();
        PrintWriter out=response.getWriter();
        try {
			List<User> list=obj.findUser(name,uname,fname);
			if(list.isEmpty())
			{
				request.setAttribute("searchError","No results found!!!");
			}
			else
			{
				request.setAttribute("list",list);
			}
			request.setAttribute("searchUname",uname);
			request.setAttribute("searchFname",fname);
		    RequestDispatcher rd=request.getRequestDispatcher("DisplayUser.jsp");
			rd.forward(request,response);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
