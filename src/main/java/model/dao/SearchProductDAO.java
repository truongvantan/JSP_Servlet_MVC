package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ValidateCommon;
import model.bean.SanPham;

public class SearchProductDAO extends BaseDAO {

	public ArrayList<SanPham> getDsSanPham(String searchText) {
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT SP.Id, TenSanPham, TH.TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH ON SP.ThuongHieu = TH.Id "
				+ "WHERE TenSanPham LIKE ? OR TenThuongHieu LIKE ? OR MoTa LIKE ? OR SP.Id = ? OR DonGiaNhap = ? OR DonGiaBan = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			
			preparedStatement.setString(1, "%" + searchText + "%");
			preparedStatement.setString(2, "%" + searchText + "%");
			preparedStatement.setString(3, "%" + searchText + "%");
			
			if (ValidateCommon.isValidStringNumber(searchText)) {
				preparedStatement.setInt(4, Integer.valueOf(searchText));
				preparedStatement.setDouble(5, Double.valueOf(searchText));
				preparedStatement.setDouble(6, Double.valueOf(searchText));
			} else {
				preparedStatement.setInt(4, -1);
				preparedStatement.setDouble(5, -1);
				preparedStatement.setDouble(6, -1);
			}
			
			resultSet = preparedStatement.executeQuery();
			SanPham sp = null;
			while (resultSet.next()) {
				sp = new SanPham();
				sp.setId(resultSet.getInt("Id"));
				sp.setTenSanPham(resultSet.getString("TenSanPham"));
				sp.setTenThuongHieu(resultSet.getString("TenThuongHieu"));
				sp.setDonGiaNhap(resultSet.getDouble("DonGiaNhap"));
				sp.setDonGiaBan(resultSet.getDouble("DonGiaBan"));
				sp.setLinkHinhAnh(resultSet.getString("LinkHinhAnh"));
				sp.setMoTa(resultSet.getString("MoTa"));
				
				dsSanPham.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return dsSanPham;
	}

	public int getTotalPageNumber(String searchText) {
		int totalPageNumber = 0;
		
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT COUNT(SP.Id) AS TongSoDong "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH ON SP.ThuongHieu = TH.Id "
				+ "WHERE TenSanPham LIKE ? OR TenThuongHieu LIKE ? OR MoTa LIKE ? OR SP.Id = ? OR DonGiaNhap = ? OR DonGiaBan = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			
			preparedStatement.setString(1, "%" + searchText + "%");
			preparedStatement.setString(2, "%" + searchText + "%");
			preparedStatement.setString(3, "%" + searchText + "%");
			
			if (ValidateCommon.isValidStringNumber(searchText)) {
				preparedStatement.setInt(4, Integer.valueOf(searchText));
				preparedStatement.setDouble(5, Double.valueOf(searchText));
				preparedStatement.setDouble(6, Double.valueOf(searchText));
			} else {
				preparedStatement.setInt(4, -1);
				preparedStatement.setDouble(5, -1);
				preparedStatement.setDouble(6, -1);
			}
			
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				totalPageNumber = resultSet.getInt("TongSoDong");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return (int)Math.ceil(totalPageNumber / 15.0);
	}

	public ArrayList<SanPham> getDsSanPham(String searchText, int pageNumber) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		
		String queryString = "SELECT * FROM (SELECT RowNum = ROW_NUMBER() OVER (ORDER BY SP.Id), SP.Id, TenSanPham, TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP INNER JOIN THUONGHIEU TH ON SP.ThuongHieu = TH.Id WHERE TenSanPham LIKE ? OR TenThuongHieu LIKE ? OR MoTa LIKE ? OR SP.Id = ? OR DonGiaNhap = ? OR DonGiaBan = ?) AS tempTable "
				+ "WHERE RowNum > (? * (? - 1)) AND RowNum <= (? * (? - 1)) + ? "
				+ "ORDER BY Id";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, "%" + searchText + "%");
			preparedStatement.setString(2, "%" + searchText + "%");
			preparedStatement.setString(3, "%" + searchText + "%");
			if (ValidateCommon.isValidStringNumber(searchText)) {
				preparedStatement.setInt(4, Integer.valueOf(searchText));
				preparedStatement.setDouble(5, Double.valueOf(searchText));
				preparedStatement.setDouble(6, Double.valueOf(searchText));
			} else {
				preparedStatement.setInt(4, -1);
				preparedStatement.setDouble(5, -1);
				preparedStatement.setDouble(6, -1);
			}
			preparedStatement.setString(7, "15");
			preparedStatement.setString(8, String.valueOf(pageNumber));
			preparedStatement.setString(9, "15");
			preparedStatement.setString(10, String.valueOf(pageNumber));
			preparedStatement.setString(11, "15");
			
			resultSet = preparedStatement.executeQuery();
			SanPham sp = null;
			while (resultSet.next()) {
				sp = new SanPham();
				sp.setId(resultSet.getInt("Id"));
				sp.setTenSanPham(resultSet.getString("TenSanPham"));
				sp.setTenThuongHieu(resultSet.getString("TenThuongHieu"));
				sp.setDonGiaNhap(resultSet.getDouble("DonGiaNhap"));
				sp.setDonGiaBan(resultSet.getDouble("DonGiaBan"));
				sp.setLinkHinhAnh(resultSet.getString("LinkHinhAnh"));
				sp.setMoTa(resultSet.getString("MoTa"));
				
				dsSanPham.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return dsSanPham;
	}

}
