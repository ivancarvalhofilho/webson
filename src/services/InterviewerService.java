package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static util.MysqlCon.select;

public class InterviewerService {

	public JSONArray getInterviewersByTest(Long testId) throws JSONException {
		return select("select distinct a.id, email, age from interviewer inner join answer a on interviewer.id = a.interviewer_id where a.question_test_id = " + testId);
	}
	
}
