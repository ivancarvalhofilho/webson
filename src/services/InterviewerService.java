package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class InterviewerService {

	public JSONArray getInterviewersByTest(Long testId) throws JSONException {

//		MOCK
		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < 5; i++) {
			JSONObject object = new JSONObject();
			object.put("interviewerName", "Faustão"+i);
			object.put("interviewerSexo", "Macho"+i);
			object.put("answerId", "1");
			jsonArray.put(object);
		}

		return jsonArray;

//		TODO: select tabela answer
//			a partir do answer.idInterview: buscar nome do entrevistado em interviewer.ibge
//			a partir do answer.idQuestion: buscar o question.idTest
//			filtrar question.idTest = {testId}

//		return select("select * from test " +
//				"where id = '" + id + "'");
		
	}
	
	public JSONObject getAnswersByTestAndInterviewer(Long testId) throws JSONException {
//		MOCK
		JSONObject object = new JSONObject();
		object.put("email", "email@email.email");
		object.put("telephone", "4002-8922");
		object.put("cep", "375666-666");
		object.put("age", "98");
		object.put("gender", "Macho");
		object.put("skinColour", "Colorido");
		object.put("infirmity", "infermidades");
		object.put("responseValue", "3");
		return object;
	}
}
