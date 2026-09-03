package hcmute.vn.controllers.catalog.common;

import hcmute.vn.entities.User;
import hcmute.vn.services.IUserService;
import hcmute.vn.services.UserServiceImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = { "/verify-otp" })
public class VerifyOtpController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/common/verify-otp.jsp").include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String inputOtp = req.getParameter("otp");

        HttpSession session = req.getSession();
        User tempUser = (User) session.getAttribute("tempUser");
        String otpCode = (String) session.getAttribute("otpCode");
        Long expireTime = (Long) session.getAttribute("otpExpireTime");

        if (expireTime != null && System.currentTimeMillis() > expireTime) {
            req.setAttribute("error", "Mã OTP đã hết hạn! Vui lòng thực hiện lại.");
            req.getRequestDispatcher("/views/common/verify-otp.jsp").include(req, resp);
            return;
        }

        if (tempUser != null && otpCode != null && otpCode.equals(inputOtp)) {
            tempUser.setCode(null);
            tempUser.setStatus(1);
            
            userService.insert(tempUser);

            session.removeAttribute("tempUser");
            session.removeAttribute("otpCode");
            session.removeAttribute("otpExpireTime");

            req.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
            req.getRequestDispatcher("/views/common/login.jsp").include(req, resp);
        } else {
            req.setAttribute("error", "Mã OTP không chính xác!");
            req.getRequestDispatcher("/views/common/verify-otp.jsp").include(req, resp);
        }
    }
}