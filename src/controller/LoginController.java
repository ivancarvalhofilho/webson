package controller;

import domain.Researcher;
import services.LoginService;

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

		String researcherName = request.getParameter("name");
		String researcherPass = request.getParameter("password");

		LoginService loginService = new LoginService();
		Researcher loggedResearcher = loginService.makeLogin(researcherName, researcherPass);
		if(loggedResearcher != null){
			session.setAttribute("loggedResearcher", loggedResearcher);
			redirect(response, "home");
			return;
		}

		response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		request.setAttribute("errorMsg", "login inválido");
		dispatchWithParams(request, response,"jsp/login/login.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loggedResearcher");
		redirect(response, "jsp/login/login.jsp");
	}
}
