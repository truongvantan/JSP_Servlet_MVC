package model.bo;

import java.util.ArrayList;

import model.bean.SanPham;
import model.dao.SearchProductDAO;

public class SearchProductBO {
	SearchProductDAO searchProductDAO = new SearchProductDAO();

	public ArrayList<SanPham> getDsSanPham(String searchText) {
		return searchProductDAO.getDsSanPham(searchText);
	}

	public int getTotalPageNumber(String searchText) {
		return searchProductDAO.getTotalPageNumber(searchText);
	}

	public ArrayList<SanPham> getDsSanPham(String searchText, int pageNumber) {
		return searchProductDAO.getDsSanPham(searchText, pageNumber);
	}
}
