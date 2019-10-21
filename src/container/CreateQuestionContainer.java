package container;

import controller.BaseController;
import domain.Question;
import domain.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateQuestionContainer", urlPatterns = "/createQuestionsContainer")
public class CreateQuestionContainer extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
//		dispatchWithParams(request, response, "jsp/createTest/createQuestionContainer.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("test", request.getAttribute("test"));
		dispatchWithParams(request, response, "jsp/createQuestions/createQuestions.jsp");
	}
}
