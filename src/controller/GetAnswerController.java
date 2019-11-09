package controller;

import controller.BaseController;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import services.AnswerService;
import services.InterviewerService;
import services.TestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetAnswerController", urlPatterns = "/getAnswerByInterviewerAndTest")
public class GetAnswerController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String answerId = request.getParameter("answerId");

		AnswerService answerService = new AnswerService();
		try {
			JSONArray jsonObject = answerService.getAnswersByTestAndInterviewer(Long.valueOf(answerId));
			request.setAttribute("answerResponse", jsonObject);
			dispatchWithParams(request, response, "jsp/answer/answerComponent.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
