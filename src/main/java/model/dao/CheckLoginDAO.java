package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckLoginDAO extends BaseDAO {

	public int getAccountRole(String tenDangNhap, String matKhau) {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT TenDangNhap, MatKhau, VaiTro FROM NGUOIDUNG WHERE TenDangNhap = ? AND MatKhau = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, tenDangNhap);
			preparedStatement.setString(2, matKhau);
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				String vaiTro = resultSet.getString("VaiTro");
				if ("admin".equals(vaiTro)) {
					return 1; // admin account
				} else {
					return 2; // user account
				}
			} else {
				return 0; // invalid account
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return 0; // invalid account
	}
	
}
