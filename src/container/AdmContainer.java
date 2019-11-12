package container;

import controller.BaseController;
import org.json.JSONArray;
import org.json.JSONException;
import services.ImageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdmContainer", urlPatterns = "/administratorContainer")
public class AdmContainer extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageService answerService = new ImageService();
		try {
			JSONArray jsonObject = answerService.getImages();
			request.setAttribute("imagesResponse", jsonObject);
			dispatchWithParams(request, response, "jsp/administrator/administratorContainer.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
