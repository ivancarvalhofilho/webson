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
		int insertedId = 0;
		try {
			Connection con = createConnection();
			Statement stmt = con.createStatement();

			insertedId = stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
			
			ResultSet rs = stmt.getGeneratedKeys();
			
			if (rs.next()){
				insertedId = rs.getInt(1);
			}
			
			con.close();
		} catch(Exception e){ System.out.println(e); }
		finally {
			return insertedId;
		}
		
	}

	private static Connection createConnection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/websondatabase","root","1234");
	}
}
