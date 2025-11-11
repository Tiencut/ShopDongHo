package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.NguoiDungBo;

/**
 * Servlet implementation class VerifyEmailServlet
 */
@WebServlet("/VerifyEmail")
public class VerifyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String token = request.getParameter("token");
		
		if (token != null && !token.isEmpty()) {
			try {
				NguoiDungBo ndBo = new NguoiDungBo();
				int rowsAffected = ndBo.updateVerificationStatus(token);
				
				if (rowsAffected > 0) {
					request.setAttribute("message", "Xác thực email thành công! Bạn có thể đăng nhập ngay bây giờ.");
				} else {
					request.setAttribute("message", "Mã thông báo xác thực không hợp lệ hoặc đã hết hạn.");
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("message", "Đã xảy ra lỗi trong quá trình xác thực email.");
			}
		} else {
			request.setAttribute("message", "Mã thông báo xác thực không được cung cấp.");
		}
		RequestDispatcher rd = request.getRequestDispatcher("sign-up.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}