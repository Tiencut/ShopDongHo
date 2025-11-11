package bo;

import bean.NguoiDungBean;
import dao.NguoiDungDao;

public class NguoiDungBo {
	NguoiDungDao ndd = new NguoiDungDao();
	
	public boolean KiemTraTonTai(String usr) {
		return ndd.KiemTraTonTai(usr);
	}

	public NguoiDungBean DangNhap(String usr, String pass) {
		return ndd.DangNhap(usr, pass);
	}
	
	public Boolean DangKi(String tenNguoiDung, String tenDangNhap, String matKhau, String email) {
		NguoiDungBean nd = new NguoiDungBean();
		nd.setTenNguoiDung(tenNguoiDung);
		nd.setTenDangNhap(tenDangNhap);
		nd.setMatKhau(matKhau);
		nd.setEmail(email);
		nd.setQuyen(false); // Mặc định là người dùng thường
        return ndd.DangKi(nd);
    }

    public int updateVerificationStatus(String verificationToken) {
        return ndd.updateVerificationStatus(verificationToken);
    }

    public boolean updateVerificationToken(String tenDangNhap, String verificationToken) {
        return ndd.updateVerificationToken(tenDangNhap, verificationToken);
    }
}
