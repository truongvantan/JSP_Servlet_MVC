package model.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.dao.BaseDAO;

public class DeleteProductDAO extends BaseDAO {

	public String deleteProduct(String idProduct) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		
		String queryString = "DELETE FROM SANPHAM WHERE Id = ?";
		String errorMessage = "";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, Integer.valueOf(idProduct));
			int x = preparedStatement.executeUpdate();
			System.out.println("Đã xóa " + x + " record.");
			errorMessage = "No error";
		} catch (SQLException e) {
			e.printStackTrace();
			errorMessage = "Unknown error";
		} finally {
			closeConnection(connection, preparedStatement, null);
		}
		
		return errorMessage;
	}

}
