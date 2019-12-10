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

@WebServlet(name = "SelectImageController", urlPatterns = "/selectImage")
public class SelectImageController extends BaseController {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImageService answerService = new ImageService();
		try {
			JSONArray jsonObject = answerService.getImages();
			request.setAttribute("imagesResponse", jsonObject);
			dispatchWithParams(request, response, "jsp/selectImage/selectImage.jsp");
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
}
