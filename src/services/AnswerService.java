package services;

import org.json.JSONArray;
import org.json.JSONException;

import static util.MysqlCon.select;

public class AnswerService {

	public JSONArray getAnswersByTestAndInterviewer(Long answerId) throws JSONException {
		return select("select " +
				"i.email, " +
				"i.phone, " +
				"i.cep, " +
				"i.age, " +
				"i.skinColor, " +
				"answer.value, " +
				"q.type, " +
				"q.title, " +
				"q.description " +
				"from answer " +
				"inner join interviewer i on answer.interviewer_id = i.id " +
				"inner join question q on answer.question_id = q.id and answer.question_test_id = q.test_id " +
				"where " +
				"answer.id = " + answerId + 
				" order by q.id asc");
	}
}
