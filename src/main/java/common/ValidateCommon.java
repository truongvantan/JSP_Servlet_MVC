package common;

public class ValidateCommon {
	public static boolean checkRequiredFields(String... strings) {
		String[] fields = strings;
		for (String s : fields) {
			if (s == null || "".equals(s)) {
				return false;
			}
		}
		return true;
	}

	// kiểm tra một chuỗi có phải là số
	public static boolean isValidStringNumber(String s) {
		if (s == null || "".equals(s)) {
			return false;
		}
		return s.matches("^[0-9]+$");
	}

	public static String validateFieldsProduct(String tenSanPham, String idThuongHieu, String donGiaNhap,
			String donGiaBan) {
		if (!checkRequiredFields(tenSanPham, idThuongHieu, donGiaNhap, donGiaBan)) {
			return "Required fields error";
		}

		if (!isValidStringNumber(idThuongHieu)) {
			return "Invalid idThuongHieu error";
		}

		if (!isValidStringNumber(donGiaNhap)) {
			return "Invalid donGiaNhap error";
		}

		if (!isValidStringNumber(donGiaBan)) {
			return "Invalid donGiaBan error";
		}

		return "No error";
	}

}
