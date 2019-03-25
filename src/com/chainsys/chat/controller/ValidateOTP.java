package com.chainsys.chat.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ValidateOTP
 */
@WebServlet("/ValidateOTP")
public class ValidateOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateOTP() {
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
		String uname=request.getParameter("uname");
		String validotp=request.getParameter("validotp");
		String otp=request.getParameter("otp");
		PrintWriter out=response.getWriter();
		RequestDispatcher rd;
		if(validotp.equalsIgnoreCase(otp))
		{
			   request.setAttribute("uname",uname);
			   rd=request.getRequestDispatcher("ChangePassword.jsp");
	  		   rd.forward(request,response);
			
		}
		else
		{
		   request.setAttribute("button","&times");
		   request.setAttribute("error","Incorrect OTP!!!");
		   rd=request.getRequestDispatcher("ForgetPassword.jsp");
  		   rd.forward(request,response);
		}
		
	}

}
