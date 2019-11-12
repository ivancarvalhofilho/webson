package controller;

import controller.BaseController;
import org.json.JSONException;
import org.json.JSONObject;
import services.TestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SaveTestController", urlPatterns = "/saveTest")
public class SaveTestController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject jsonObject = null;
		try {
			jsonObject = new JSONObject(request.getParameter("jsonString"));
			TestService testService = new TestService();
			testService.saveTest(jsonObject);
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect("jsp/home/home.jsp");
	}
}
