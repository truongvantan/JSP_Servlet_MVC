package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateProductDAO extends BaseDAO {

	public String insertNewProduct(String tenSanPham, String idThuongHieu, String donGiaNhap, String donGiaBan,
			String linkHinhAnh, String moTa) {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		
		String queryString = "INSERT INTO SANPHAM (TenSanPham, ThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa) VALUES (?,?,?,?,?,?)";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, tenSanPham);
			preparedStatement.setInt(2, Integer.valueOf(idThuongHieu));
			preparedStatement.setDouble(3, Double.valueOf(donGiaNhap));
			preparedStatement.setDouble(4, Double.valueOf(donGiaBan));
			preparedStatement.setString(5, linkHinhAnh);
			preparedStatement.setString(6, moTa);
			
			int x = preparedStatement.executeUpdate();
			System.out.println("Đã insert " + x + " record.");
		} catch (SQLException e) {
			e.printStackTrace();
			
			String errorMessage = e.getMessage();
			if (errorMessage != null) {
				if (errorMessage.contains("The duplicate key value is")) {
					return "Duplicate ID Error";
					
				}
				if (errorMessage.contains("conflicted with the FOREIGN KEY constraint")) {
					return "Conflict foreign key";
				}
			}
		} finally {
			closeConnection(connection, preparedStatement, null);
		}
		
		return "No error";
	}

}
