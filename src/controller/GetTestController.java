package controller;

import org.json.JSONArray;
import org.json.JSONException;
import services.TestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetTestController", urlPatterns = "/searchTests")
public class GetTestController extends BaseController {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TestService testService = new TestService();
		try {
			JSONArray jsonObject = testService.getTests();
			req.setAttribute("testList", jsonObject);
			dispatchWithParams(req, resp, "jsp/tests/testComponent.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
