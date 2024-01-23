package model.bo;

import common.ValidateCommon;

public class DeleteProductBO {
	DeleteProductDAO deleteProductDAO = new DeleteProductDAO();

	public String deleteProduct(String idProduct) {
		if (!ValidateCommon.isValidStringNumber(idProduct)) {
			return "Invalid idProduct";
		}
		return deleteProductDAO.deleteProduct(idProduct);
	}
	
}
