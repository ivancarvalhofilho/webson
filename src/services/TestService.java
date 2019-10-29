package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static util.MysqlCon.insert;
import static util.MysqlCon.select;

public class TestService {

	public void saveTest(JSONObject testJson) throws JSONException {
		int res =  insert(
			"insert into test (title, description)" +
					" values('" + testJson.getString("title") + 
					"','" + testJson.getString("description") + "')"
			);
	}
	
	public JSONArray searchTests() throws JSONException {
		return select("select * from test");
	}
}
