package container;


import controller.BaseController;
import org.json.JSONException;
import services.ImageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddImageContainer", urlPatterns = "/addImageContainer")
public class AddImageContainer extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String img = request.getParameter("img");

			ImageService imageService = new ImageService();
			imageService.saveImage(img);
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		redirect(response, "jsp/saveImages/createImages.jsp");
	}
}
