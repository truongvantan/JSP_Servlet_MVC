package model.bo;

import java.util.ArrayList;

import model.bean.SanPham;
import model.dao.ShowProductListDAO;

public class ShowProductListBO {
	ShowProductListDAO showProductListDAO = new ShowProductListDAO();

	public ArrayList<SanPham> getDsSanPham() {
		return showProductListDAO.getDsSanPham();
	}

	public ArrayList<SanPham> getDsSanPhamByThuongHieu(String idThuongHieu) {
		return showProductListDAO.getDsSanPhamByThuongHieu(idThuongHieu);
	}

	public ArrayList<SanPham> getDsSanPham(int pageNumber) {
//		return showProductListDAO.getDsSanPham(pageNumber);
		return showProductListDAO.getDsSanPhamSQL(pageNumber);
	}

	public int getTotalPageNumber() {
		return showProductListDAO.getTotalPageNumber();
	}

	public ArrayList<SanPham> getDsSanPhamByThuongHieu(String idThuongHieu, int pageNumber) {
//		return showProductListDAO.getDsSanPhamByThuongHieu(idThuongHieu, pageNumber);
		return showProductListDAO.getDsSanPhamByThuongHieuSQL(idThuongHieu, pageNumber);
	}

	public int getTotalPageNumberByThuongHieu(String idThuongHieu) {
		return showProductListDAO.getTotalPageNumberByThuongHieu(idThuongHieu);
	}
}
