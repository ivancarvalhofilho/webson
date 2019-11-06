package controller;

import controller.BaseController;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import services.InterviewerService;
import services.TestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetInterviewerTestController", urlPatterns = "/getInterviewerTestController")
public class GetInterviewerTestController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idTest = request.getParameter("idTest");
		
		InterviewerService interviewerService = new InterviewerService();
		try {
			JSONArray jsonObject = interviewerService.getInterviewersByTest(Long.valueOf(idTest));
			request.setAttribute("interviewerList", jsonObject);
			dispatchWithParams(request, response, "jsp/interviewer/interviewerTestComponent.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
