package controller;

import org.json.JSONArray;
import org.json.JSONException;
import services.AnswerService;
import services.ImageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteImagesController", urlPatterns = "/deleteImage")
public class DeleteImagesController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageService imageService = new ImageService();
		try {
			JSONArray jsonObject = imageService.getImages();
			request.setAttribute("imagesResponse", jsonObject);
			dispatchWithParams(request, response, "jsp/.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
