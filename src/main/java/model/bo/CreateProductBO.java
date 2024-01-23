package model.bo;

import common.ValidateCommon;
import model.dao.CreateProductDAO;

public class CreateProductBO {
	CreateProductDAO createProductDAO = new CreateProductDAO();

	public String insertNewProduct(String tenSanPham, String idThuongHieu, String donGiaNhap, String donGiaBan,
			String linkHinhAnh, String moTa) {

		String validateMessage = ValidateCommon.validateFieldsProduct(tenSanPham, idThuongHieu, donGiaNhap, donGiaBan);
		if (!"No error".equals(validateMessage)) {
			return validateMessage;
		}

		String errorMessage = null;

		for (int i = 1; i <= 10; i++) {
			String returnedMessage = createProductDAO.insertNewProduct(tenSanPham, idThuongHieu, donGiaNhap, donGiaBan,
					linkHinhAnh, moTa);
			if ("Duplicate ID Error".equals(returnedMessage)) {
				errorMessage = "Duplicate ID Error";
				continue;
			} else if ("Conflict foreign key".equals(returnedMessage)) {
				errorMessage = "Conflict foreign key";
				break;
			} else if ("No error".equals(returnedMessage)) {
				errorMessage = "No error";
				break;
			}
		}

		return errorMessage;
	}
}
