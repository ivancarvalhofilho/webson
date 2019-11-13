package services;

import domain.Researcher;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import util.MysqlCon;

import static util.MysqlCon.select;

public class LoginService {

	public Researcher makeLogin(String name, String password) throws JSONException {
		Researcher loggedResearcher = checkResearcherExists(name);
		return loggedResearcher;		
	}
	
	public Boolean checkResearcherExists(Long researcherId) {
		JSONArray res = select(
				"select * from user "+
				"where id = '" + researcherId + "'");
		return res.length() > 0;
	}
	
	public Researcher checkResearcherExists(String researcherName) throws JSONException {
		JSONArray res =  select(
				"select * from user "+
				"where email like '" + researcherName + "' ");
		
		if (res.length() > 0) {
			JSONObject researcher = (JSONObject) res.get(0);
			return new Researcher(
					researcher.getLong("id"),
					researcher.getString("name"),
					null
			);
		}
		return null;
	}
}
