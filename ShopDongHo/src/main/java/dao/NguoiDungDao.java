package dao;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.NguoiDungBean;

public class NguoiDungDao {
	public static String ecrypt(String text) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String enrtext;
		MessageDigest msd = MessageDigest.getInstance("MD5");
		byte[] srctextbyte = text.getBytes("UTF-8");
		byte[] enrtextbyte = msd.digest(srctextbyte);
		BigInteger big = new BigInteger(1, enrtextbyte);
		enrtext = big.toString(16);
		return enrtext;
	}

	public boolean KiemTraTonTai(String usr) {
		KetNoi kn = new KetNoi();
		String qry = "select * from NguoiDung where TenDangNhap = ?";
		PreparedStatement ps;
		try {
			
			ps = kn.cn.prepareStatement(qry);
			ps.setString(1, usr);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				return true;
			rs.close();
			kn.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public NguoiDungBean DangNhap(String usr, String pass) {
		try {
			KetNoi kn = new KetNoi();
			
			pass = ecrypt(pass);
			String qry = "select * from NguoiDung where TenDangNhap = ? and MatKhau = ?";
			PreparedStatement ps = kn.cn.prepareStatement(qry);
			ps.setString(1, usr);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int maNguoiDung = rs.getInt(1);
				String tenNguoiDung = rs.getNString(2);
				String tenDangNhap = rs.getString(3);
				String MatKhau = rs.getString(4);
				boolean Quyen = rs.getBoolean(5);
				rs.close();
				kn.cn.close();
				return new NguoiDungBean(maNguoiDung, tenNguoiDung, tenDangNhap, MatKhau, Quyen);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Boolean DangKi(NguoiDungBean nd) {
		try {
			KetNoi kn = new KetNoi();
			String qry = "INSERT INTO NguoiDung (TenNguoiDung, TenDangNhap, MatKhau, Email, Quyen, IsVerified) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = kn.cn.prepareStatement(qry);
			ps.setNString(1, nd.getTenNguoiDung());
			ps.setString(2, nd.getTenDangNhap());
			ps.setString(3, ecrypt(nd.getMatKhau()));
			ps.setString(4, nd.getEmail());
			ps.setBoolean(5, false); // Mặc định là người dùng thường
			ps.setBoolean(6, false); // Mặc định chưa xác thực
			int res = ps.executeUpdate();
			kn.cn.close();
			return res > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
    public int updateVerificationStatus(String verificationToken) {
        try {
            KetNoi kn = new KetNoi();
            String qry = "UPDATE NguoiDung SET IsVerified = TRUE, VerificationToken = NULL WHERE VerificationToken = ?";
            PreparedStatement ps = kn.cn.prepareStatement(qry);
            ps.setString(1, verificationToken);
            int rowsAffected = ps.executeUpdate();
            kn.cn.close();
            return rowsAffected;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean updateVerificationToken(String tenDangNhap, String verificationToken) {
        try {
            KetNoi kn = new KetNoi();
            String qry = "UPDATE NguoiDung SET VerificationToken = ?, IsVerified = FALSE WHERE TenDangNhap = ?";
            PreparedStatement ps = kn.cn.prepareStatement(qry);
            ps.setString(1, verificationToken);
            ps.setString(2, tenDangNhap);
            int rowsAffected = ps.executeUpdate();
            kn.cn.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
