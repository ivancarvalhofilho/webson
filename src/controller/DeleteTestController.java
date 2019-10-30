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

@WebServlet(name = "DeleteTestController", urlPatterns = "/deleteTest")
public class DeleteTestController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Long id = Long.valueOf(request.getParameter("id"));
			TestService testService = new TestService();
			testService.deleteTest(id);
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect("jsp/home/home.jsp");
	}
}
