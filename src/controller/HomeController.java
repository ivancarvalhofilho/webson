package controller;

import domain.User;
import services.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "HomeController", urlPatterns = "/home")
public class HomeController extends BaseController {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkCredentials(request, response, request.getSession());
		
		response.sendRedirect("jsp/home");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkCredentials(request, response, request.getSession());

		response.sendRedirect("jsp/home/home.jsp");
	}
}
