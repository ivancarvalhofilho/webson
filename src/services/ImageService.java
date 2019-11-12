package services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import static util.MysqlCon.insert;

public class ImageService {

	public void saveImage(String img) throws JSONException {
//		TODO: save img no banco
	}

	public void deleteTest(Long id) throws JSONException {
//		int res =  insert(
//				"delete from test " +
//						" where id = '" + id + "'"
//		);
	}
	
	public JSONArray getImages() throws JSONException {
//		MOCK
		JSONArray responseList = new JSONArray();

		JSONObject object = new JSONObject();
		object.put("id", "1");
		object.put("url", "https://cdn.dicionariopopular.com/imagens/meme-da-mulher-gritando-com-o-gato-na-mesa-og.jpg");
		responseList.put(object);
		
		JSONObject object2 = new JSONObject();
		object2.put("id", "1");
		object2.put("url", "https://cdn.dicionariopopular.com/imagens/meme-da-mulher-gritando-com-o-gato-na-mesa-og.jpg");
		responseList.put(object2);
		
		JSONObject object3 = new JSONObject();
		object3.put("id", "1");
		object3.put("url", "https://cdn.dicionariopopular.com/imagens/meme-da-mulher-gritando-com-o-gato-na-mesa-og.jpg");
		responseList.put(object3);
		
		return responseList;
	}
}
