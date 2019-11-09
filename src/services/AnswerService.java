package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AnswerService {

	public JSONArray getAnswersByTestAndInterviewer(Long answerId) throws JSONException {
//		MOCK
		JSONArray responseList = new JSONArray();

		for (int i = 0; i < 5; i++) {
			JSONObject object = new JSONObject();
			object.put("email", "email@email.email" + i);
			object.put("telephone", "4002-8922" + i);
			object.put("cep", "375666-666" + i);
			object.put("age", "98" + i);
			object.put("gender", "Macho" + i);
			object.put("skinColour", "Colorido" + i);
			object.put("infirmity", "infermidades" + i);
			object.put("questionType", (i%2)+1);
			object.put("responseValue", i);
			object.put("questionTitle", "Tielelle" + i);
			object.put("questionDescription", "adasdas" + i);
			responseList.put(object);
		}

		return responseList;
	}
}
