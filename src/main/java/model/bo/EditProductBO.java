package model.bo;

import common.ValidateCommon;
import model.bean.SanPham;
import model.dao.EditProductDAO;

public class EditProductBO {
	EditProductDAO editProductDAO = new EditProductDAO();

	public SanPham getProductInfo(String idProduct) {
		if (!ValidateCommon.isValidStringNumber(idProduct)) {
			return null;
		}
		return editProductDAO.getProductInfo(idProduct);
	}

	public String editProduct(String maSanPham, String tenSanPham, String idThuongHieu, String donGiaNhap, String donGiaBan,
			String linkHinhAnh, String moTa) {
		String validateMessage = ValidateCommon.validateFieldsProduct(tenSanPham, idThuongHieu, donGiaNhap, donGiaBan);
		if (!"No error".equals(validateMessage)) {
			return validateMessage;
		}
		return editProductDAO.editProduct(maSanPham, tenSanPham, idThuongHieu, donGiaNhap, donGiaBan, linkHinhAnh, moTa);
	}
}
