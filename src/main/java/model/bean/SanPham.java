package model.bean;

public class SanPham {
	private int id;
	private String tenSanPham;
	private int thuongHieu;
	private String tenThuongHieu;
	private double donGiaNhap;
	private double donGiaBan;
	private double soLuongTonKho;
	private String linkHinhAnh;
	private String moTa;

	public SanPham() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public int getThuongHieu() {
		return thuongHieu;
	}

	public void setThuongHieu(int thuongHieu) {
		this.thuongHieu = thuongHieu;
	}

	public String getTenThuongHieu() {
		return tenThuongHieu;
	}

	public void setTenThuongHieu(String tenThuongHieu) {
		this.tenThuongHieu = tenThuongHieu;
	}

	public double getDonGiaNhap() {
		return donGiaNhap;
	}

	public void setDonGiaNhap(double donGiaNhap) {
		this.donGiaNhap = donGiaNhap;
	}

	public double getDonGiaBan() {
		return donGiaBan;
	}

	public void setDonGiaBan(double donGiaBan) {
		this.donGiaBan = donGiaBan;
	}

	public double getSoLuongTonKho() {
		return soLuongTonKho;
	}

	public void setSoLuongTonKho(double soLuongTonKho) {
		this.soLuongTonKho = soLuongTonKho;
	}

	public String getLinkHinhAnh() {
		return linkHinhAnh;
	}

	public void setLinkHinhAnh(String linkHinhAnh) {
		this.linkHinhAnh = linkHinhAnh;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

}
