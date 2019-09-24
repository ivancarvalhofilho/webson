package container;

import controller.BaseController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "TestsContainer", urlPatterns = "/testContainer")
public class TestsContainer extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		checkCredentials(request, response, request.getSession());

		request.setAttribute("errorMsg", "login inválido");
		dispatchWithParams(request, response, "jsp/tests/testContainer.jsp");
	}
}
