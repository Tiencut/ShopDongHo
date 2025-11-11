package controller;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.NguoiDungBo;
import bean.NguoiDungBean;
import utils.EmailUtil;

/**
 * Servlet implementation class EmailVerificationController
 */
@WebServlet("/EmailVerificationController")
public class EmailVerificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailVerificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String tenDangNhap = request.getParameter("tenDangNhap");
		String matKhau = request.getParameter("matKhau");
		String hoTen = request.getParameter("hoTen");
		
		String token = UUID.randomUUID().toString();
		
		NguoiDungBean newUser = new NguoiDungBean();
		newUser.setHoTen(hoTen);
		newUser.setTenDangNhap(tenDangNhap);
		newUser.setMatKhau(matKhau);
		newUser.setQuyen(false); // Mặc định là người dùng thường
		newUser.setVerificationToken(token);
		newUser.setVerified(false);
		
		NguoiDungBo ndBo = new NguoiDungBo();
		boolean success = ndBo.DangKi(newUser);
		
		if (success) {
			String verificationLink = request.getRequestURL().toString().replace(request.getRequestURI(), "") + request.getContextPath() + "/VerifyEmail?token=" + token;
			String subject = "Xác thực tài khoản của bạn";
			String content = "Chào bạn,<br/><br/>Vui lòng nhấp vào liên kết sau để xác thực tài khoản của bạn: <a href=\"" + verificationLink + "\">Xác thực Email</a><br/><br/>Trân trọng,";
			
			try {
					EmailUtil.sendEmail(email, subject, content);
					request.setAttribute("message", "Đăng ký thành công! Email xác thực đã được gửi đến " + email + ". Vui lòng kiểm tra hộp thư của bạn.");
				} catch (Exception e) {
					e.printStackTrace();
					request.setAttribute("message", "Đăng ký thành công nhưng có lỗi xảy ra khi gửi email xác thực.");
				}
			} else {
				request.setAttribute("message", "Đăng ký không thành công. Tên đăng nhập có thể đã tồn tại.");
			}
		} else {
			request.setAttribute("message", "Đăng ký không thành công. Vui lòng thử lại.");
		}
		RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
		rd.forward(request, response);

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}