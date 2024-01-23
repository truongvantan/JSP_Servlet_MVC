package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDAO {
	private static String hostName = "localhost";
	private static String usename = "sa1";
	private static String password = "123";
	private static String database = "MyMVC";

	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("net.sourceforge.jtds.jdbc.Driver");
			String connectionURL = "jdbc:jtds:sqlserver://" + hostName + ":1433/" + database + ";CharacterSet=UTF-8";
			conn = DriverManager.getConnection(connectionURL, usename, password);
			System.out.println("Connected!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}

	public void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
//	public static void main(String[] args) {
//		BaseDAO baseDAO = new BaseDAO();
//		baseDAO.getConnection();
//	}
	
}
