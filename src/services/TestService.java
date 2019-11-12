package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static util.MysqlCon.insert;
import static util.MysqlCon.select;

public class TestService {

	public void saveTest(JSONObject testJson) throws JSONException {
		if(!testJson.isNull("id") && !testJson.get("id").equals("")){
			int res = insert("update test set " +
					" title='" + testJson.getString("title") + "'," +
					" description='" + testJson.getString("description") + "'" +
					" where id="+testJson.get("id")
			);
		} else {
			int res = insert(
					"insert into test (title, description)" +
							" values('" + testJson.getString("title") +
							"','" + testJson.getString("description") + "')"
			);
		}
	}
	
	public void deleteTest(Long id) throws JSONException {
		int res =  insert(
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
