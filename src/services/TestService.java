package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static util.MysqlCon.insert;
import static util.MysqlCon.select;

public class TestService {

	public void saveTest(JSONObject testJson) throws JSONException {
		
		// UPDATE
		if(!testJson.isNull("id") && !testJson.get("id").equals("")){ 
			insert("update test set " +
					" title='" + testJson.getString("title") + "'," +
					" description='" + testJson.getString("description") + "'" +
					" where id="+testJson.get("id")
			);
			int idTest = testJson.getInt("id");
			deleteAllQuestionsByTest(idTest);
			insertQuestionsInTest(testJson, idTest);
		} else { // INSERT
			int idTest = insert(
			"insert into test (title, description)" +
					" values('" + testJson.getString("title") +
					"','" + testJson.getString("description") + "')"
			);

			insertQuestionsInTest(testJson, idTest);
		}
		
	}

	private void insertQuestionsInTest(JSONObject testJson, int idTest) throws JSONException {
		JSONArray jsonArray = (JSONArray) testJson.get("questionList");
		for (int i=0; i < jsonArray.length(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			String title = jsonObject.getString("title");
			String description = jsonObject.getString("description");
			String type = jsonObject.getString("type");
			
			insert(
					"insert into question (test_id, title, description, type)" +
							" values('" 
							+ idTest +
							"','" + title + 
							"','" + description + 
							"','" + type + 
							"')"
			);
		}
	}

	private void deleteAllQuestionsByTest(int idTest) {
		insert(
				"delete from question " +
						" where test_id = '" + idTest + "'"
		);
	}

	public void deleteTest(Long id) throws JSONException {

		deleteAllQuestionsByTest(Math.toIntExact(id));
		
		insert(
			"delete from test " +
					" where id = '" + id + "'"
			);
	}
	
	public JSONArray getTests() throws JSONException {
		return select("select * from test");
	}
	
	public JSONArray getTest(Long id) throws JSONException {
		return select("select * from test " +
				"where id = '" + id + "'");
	}
}
