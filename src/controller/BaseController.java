package controller;

import domain.Researcher;
import services.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BaseController extends HttpServlet {
	
	protected void checkCredentials(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		Researcher loggedResearcher = (Researcher) session.getAttribute("loggedResearcher");

		Long researcherId = loggedResearcher.getId();
		if(researcherId == null){
			response.sendRedirect("login");
		}

		LoginService loginService = new LoginService();
		if(!loginService.checkResearcherExists(researcherId)){
			response.sendRedirect("login");
		}
	}
	
	protected void redirect(HttpServletResponse response, String url) throws IOException {
		response.sendRedirect(url);
	}
	
	protected void dispatchWithParams(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
