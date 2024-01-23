package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.bean.SanPham;

public class EditProductDAO extends BaseDAO {

	public SanPham getProductInfo(String idProduct) {		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT Id, TenSanPham, ThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa FROM SANPHAM WHERE Id = ?";
		
		SanPham sp = null;
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, Integer.valueOf(idProduct));
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				sp = new SanPham();
				sp.setId(resultSet.getInt("Id"));
				sp.setTenSanPham(resultSet.getString("TenSanPham"));
				sp.setThuongHieu(resultSet.getInt("ThuongHieu"));
				sp.setDonGiaNhap(resultSet.getDouble("DonGiaNhap"));
				sp.setDonGiaBan(resultSet.getDouble("DonGiaBan"));
				sp.setLinkHinhAnh(resultSet.getString("LinkHinhAnh"));
				sp.setMoTa(resultSet.getString("MoTa"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return sp;
	}

	public String editProduct(String maSanPham, String tenSanPham, String idThuongHieu, String donGiaNhap, String donGiaBan,
			String linkHinhAnh, String moTa) {
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		
		String queryString = "UPDATE SANPHAM SET TenSanPham = ?, ThuongHieu = ?, DonGiaNhap = ?, DonGiaBan = ?, LinkHinhAnh = ?, MoTa = ? WHERE Id = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, tenSanPham);
			preparedStatement.setInt(2, Integer.valueOf(idThuongHieu));
			preparedStatement.setDouble(3, Double.valueOf(donGiaNhap));
			preparedStatement.setDouble(4, Double.valueOf(donGiaBan));
			preparedStatement.setString(5, linkHinhAnh);
			preparedStatement.setString(6, moTa);
			preparedStatement.setInt(7, Integer.valueOf(maSanPham));
			
			int x = preparedStatement.executeUpdate();
			System.out.println("Đã update " + x + " record.");
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
