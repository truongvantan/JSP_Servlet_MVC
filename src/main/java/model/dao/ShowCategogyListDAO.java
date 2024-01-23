package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ThuongHieu;

public class ShowCategogyListDAO extends BaseDAO {

	public ArrayList<ThuongHieu> getDsThuongHieu() {
		ArrayList<ThuongHieu> dsThuongHieu = new ArrayList<ThuongHieu>();
		Connection connection = getConnection();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		String queryString = "SELECT Id, TenThuongHieu FROM THUONGHIEU";
		
		try {
			preparedStatement = connection.prepareStatement(queryString);
			resultSet = preparedStatement.executeQuery();
			ThuongHieu th = null;
			while (resultSet.next()) {
				th = new ThuongHieu();
				th.setId(resultSet.getInt("Id"));
				th.setTenThuongHieu(resultSet.getString("TenThuongHieu"));
				dsThuongHieu.add(th);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConnection(connection, preparedStatement, resultSet);
		}
		return dsThuongHieu;
	}

}
