package util;

import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;


public class MysqlCon {
	
	public static JSONArray select(String query) {
		JSONArray json = new JSONArray();

		try {
			Connection con = createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			ResultSetMetaData rsmd = rs.getMetaData();
			
			while(rs.next()) {
				int numColumns = rsmd.getColumnCount();
				JSONObject obj = new JSONObject();
				for (int i=1; i<=numColumns; i++) {
					String column_name = rsmd.getColumnName(i);
					obj.put(column_name, rs.getObject(column_name));
				}
				json.put(obj);
			}
			
			con.close();
		} catch(Exception e){ System.out.println(e); }
		finally {
			return json;
		}
		
	}
	
	public static int insert(String query){
		JSONArray json = new JSONArray();
		int numberUpdatedRows = 0;
		try {
			Connection con = createConnection();
			Statement stmt = con.createStatement();
			numberUpdatedRows = stmt.executeUpdate(query);

			con.close();
		} catch(Exception e){ System.out.println(e); }
		finally {
			return numberUpdatedRows;
		}
		
	}

	private static Connection createConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/websondb","root","1234");
	}
}
