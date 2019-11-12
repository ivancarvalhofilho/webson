package container;

import controller.BaseController;
import domain.Question;
import domain.Test;
import org.json.JSONArray;
import org.json.JSONException;
import services.TestService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateTestContainer", urlPatterns = "/createTestContainer")
public class CreateTestContainer extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		dispatchWithParams(request, response, "jsp/createQuestions/createQuestions.jsp");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		TestService testService = new TestService();
		if(id != null){
			try {
				JSONArray jsonArray = testService.searchTest(Long.valueOf(id));
				request.setAttribute("test", jsonArray.length() > 0 ? jsonArray.get(0) : null);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		dispatchWithParams(request, response, "jsp/createTest/createTestContainer.jsp");
	}
}
