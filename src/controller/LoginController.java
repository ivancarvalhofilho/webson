package controller;

import domain.User;
import services.LoginService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controller.Login", urlPatterns = "/login")
public class LoginController extends BaseController {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String userName = request.getParameter("name");
		String userPass = request.getParameter("password");

		LoginService loginService = new LoginService();
		User loggedUser = loginService.makeLogin(userName, userPass);
		if(loggedUser != null){
			session.setAttribute("loggedUser", loggedUser);
			redirect(response, "home");
			return;
		}

		response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		request.setAttribute("errorMsg", "login inválido");
		dispatchWithParams(request, response,"jsp/login/login.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		redirect(response, "jsp/login/login.jsp");
	}
}
