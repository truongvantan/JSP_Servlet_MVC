package model.bo;

import java.util.ArrayList;

import model.bean.ThuongHieu;
import model.dao.ShowCategogyListDAO;

public class ShowCategogyListBO {
	ShowCategogyListDAO showCategogyListDAO = new ShowCategogyListDAO();

	public ArrayList<ThuongHieu> getDsThuongHieu() {
		return showCategogyListDAO.getDsThuongHieu();
	}
}
