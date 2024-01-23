package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.ValidateCommon;
import model.bean.SanPham;

public class ShowProductListDAO extends BaseDAO {	

	public ArrayList<SanPham> getDsSanPham() {
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT SP.Id, TenSanPham, TH.TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH "
				+ "ON SP.ThuongHieu = TH.Id";
		try {
			preparedStatement = connection.prepareStatement(queryString);
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

	public ArrayList<SanPham> getDsSanPhamByThuongHieu(String idThuongHieu) {
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		int thuongHieu = 0;
		if (ValidateCommon.isValidStringNumber(idThuongHieu)) {
			thuongHieu = Integer.valueOf(idThuongHieu);
		}
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String queryString = "SELECT SP.Id, TenSanPham, TH.TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH "
				+ "ON SP.ThuongHieu = TH.Id "
				+ "WHERE SP.ThuongHieu = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, thuongHieu);
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		return dsSanPham;
	}

	public ArrayList<SanPham> getDsSanPham(int pageNumber) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<SanPham> tempList = new ArrayList<SanPham>();
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		
		String queryString = "SELECT SP.Id, TenSanPham, TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH "
				+ "ON SP.ThuongHieu = TH.Id "
				+ "ORDER BY SP.Id";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			resultSet = preparedStatement.executeQuery();
			int itemNumber = 0;
			SanPham sp = null;
			while (resultSet.next() && itemNumber < pageNumber * 15) {
				itemNumber++;
				sp = new SanPham();
				sp.setId(resultSet.getInt("Id"));
				sp.setTenSanPham(resultSet.getString("TenSanPham"));
				sp.setTenThuongHieu(resultSet.getString("TenThuongHieu"));
				sp.setDonGiaNhap(resultSet.getDouble("DonGiaNhap"));
				sp.setDonGiaBan(resultSet.getDouble("DonGiaBan"));
				sp.setLinkHinhAnh(resultSet.getString("LinkHinhAnh"));
				sp.setMoTa(resultSet.getString("MoTa"));
				
				tempList.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		// Tính toán số trang:
		int pageQuantity = (int) Math.ceil(tempList.size() / 15.0);
		if (pageNumber > pageQuantity || pageNumber <= 0) { // Số trang không hợp lệ
			return dsSanPham; // Trả về danh sách rỗng
		} else {
			for (int i = (pageNumber - 1) * 15;  (i < pageNumber * 15) && (i < tempList.size()); i++) {
				dsSanPham.add(tempList.get(i));
			}
		}
		
		return dsSanPham;
	}

	public int getTotalPageNumber() {
		int totalPageNumber = 0;
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT COUNT(Id) AS TongSoDong FROM SANPHAM";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
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

	public int getTotalPageNumberByThuongHieu(String idThuongHieu) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		int totalPageNumber = 0;
		int thuongHieu = 0;
		if (ValidateCommon.isValidStringNumber(idThuongHieu)) {
			thuongHieu = Integer.valueOf(idThuongHieu);
		}
		
		String queryString = "SELECT COUNT(Id) AS TongSoDong FROM SANPHAM WHERE ThuongHieu = ?";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, thuongHieu);
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

	public ArrayList<SanPham> getDsSanPhamByThuongHieu(String idThuongHieu, int pageNumber) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<SanPham> tempList = new ArrayList<SanPham>();
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		int thuongHieu = 0;
		if (ValidateCommon.isValidStringNumber(idThuongHieu)) {
			thuongHieu = Integer.valueOf(idThuongHieu);
		}
		
		String queryString = "SELECT SP.Id, TenSanPham, TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa "
				+ "FROM SANPHAM SP "
				+ "INNER JOIN THUONGHIEU TH "
				+ "ON SP.ThuongHieu = TH.Id "
				+ "WHERE SP.ThuongHieu = ? "
				+ "ORDER BY SP.Id";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, thuongHieu);
			resultSet = preparedStatement.executeQuery();
			int itemNumber = 0;
			SanPham sp = null;
			while (resultSet.next() && itemNumber < pageNumber * 15) {
				itemNumber++;
				sp = new SanPham();
				sp.setId(resultSet.getInt("Id"));
				sp.setTenSanPham(resultSet.getString("TenSanPham"));
				sp.setTenThuongHieu(resultSet.getString("TenThuongHieu"));
				sp.setDonGiaNhap(resultSet.getDouble("DonGiaNhap"));
				sp.setDonGiaBan(resultSet.getDouble("DonGiaBan"));
				sp.setLinkHinhAnh(resultSet.getString("LinkHinhAnh"));
				sp.setMoTa(resultSet.getString("MoTa"));
				
				tempList.add(sp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		// Tính toán số trang:
		int pageQuantity = (int) Math.ceil(tempList.size() / 15.0);
		if (pageNumber > pageQuantity || pageNumber <= 0) { // Số trang không hợp lệ
			return dsSanPham; // Trả về danh sách rỗng
		} else {
			for (int i = (pageNumber - 1) * 15;  (i < pageNumber * 15) && (i < tempList.size()); i++) {
				dsSanPham.add(tempList.get(i));
			}
		}
		
		return dsSanPham;
	}

	public ArrayList<SanPham> getDsSanPhamSQL(int pageNumber) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		
		String queryString = "SELECT * FROM (SELECT RowNum = ROW_NUMBER() OVER (ORDER BY SP.Id), SP.Id, TenSanPham, TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa FROM SANPHAM SP INNER JOIN THUONGHIEU TH ON SP.ThuongHieu = TH.Id) AS tempTable "
				+ "WHERE RowNum > (? * (? - 1)) AND RowNum <= (? * (? - 1)) + ? "
				+ "ORDER BY Id";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setString(1, "15");
			preparedStatement.setString(2, String.valueOf(pageNumber));
			preparedStatement.setString(3, "15");
			preparedStatement.setString(4, String.valueOf(pageNumber));
			preparedStatement.setString(5, "15");
			
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
			System.out.println("Get dsSanPham by SQL.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return dsSanPham;
	}

	public ArrayList<SanPham> getDsSanPhamByThuongHieuSQL(String idThuongHieu, int pageNumber) {
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		ArrayList<SanPham> dsSanPham = new ArrayList<SanPham>();
		int thuongHieu = 0;
		if (ValidateCommon.isValidStringNumber(idThuongHieu)) {
			thuongHieu = Integer.valueOf(idThuongHieu);
		}
		
		String queryString = "SELECT * FROM (SELECT RowNum = ROW_NUMBER() OVER (ORDER BY SP.Id), SP.Id, TenSanPham, TenThuongHieu, DonGiaNhap, DonGiaBan, LinkHinhAnh, MoTa FROM SANPHAM SP INNER JOIN THUONGHIEU TH ON SP.ThuongHieu = TH.Id WHERE SP.ThuongHieu = ?) AS tempTable "
				+ "WHERE RowNum > (? * (? - 1)) AND RowNum <= (? * (? - 1)) + ? "
				+ "ORDER BY Id";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			preparedStatement.setInt(1, thuongHieu);
			preparedStatement.setString(2, "15");
			preparedStatement.setString(3, String.valueOf(pageNumber));
			preparedStatement.setString(4, "15");
			preparedStatement.setString(5, String.valueOf(pageNumber));
			preparedStatement.setString(6, "15");
			
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
			System.out.println("Get dsSanPham by ThuongHieu SQL.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		
		return dsSanPham;
	}

}
