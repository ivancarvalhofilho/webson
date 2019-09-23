package controller;

import com.sun.deploy.net.HttpRequest;
import domain.User;
import services.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class BaseController extends HttpServlet {
	
	void checkCredentials (HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		User loggedUser = (User) session.getAttribute("loggedUser");

		Long userId = loggedUser.getId();
		if(userId == null){
			response.sendRedirect("login");
		}

		LoginService loginService = new LoginService();
		if(!loginService.checkUserExists(userId)){
			response.sendRedirect("login");
		}
	}
	
	void redirect(HttpServletResponse response, String url) throws IOException {
		response.sendRedirect(url);
	}
	
	void dispatchWithParams(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
