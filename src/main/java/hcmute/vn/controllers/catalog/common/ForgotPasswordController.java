package hcmute.vn.controllers.catalog.common;

import hcmute.vn.entities.User;
import hcmute.vn.services.IUserService;
import hcmute.vn.services.UserServiceImpl;
import hcmute.vn.utils.EmailUtil;
import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(urlPatterns = { "/forgot-password", "/reset-password" })
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/forgot-password".equals(path)) {
            // Thay forward -> include
            req.getRequestDispatcher("/views/common/forgot-password.jsp").include(req, resp);
        } else if ("/reset-password".equals(path)) {
            // Thay forward -> include
            req.getRequestDispatcher("/views/common/reset-password.jsp").include(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        if ("/forgot-password".equals(path)) {
            String email = req.getParameter("email");
            User user = userService.findByEmail(email);

            if (user != null) {
                String otp = String.format("%06d", new Random().nextInt(900000) + 100000);

                HttpSession session = req.getSession();
                session.setAttribute("resetEmail", email);
                session.setAttribute("resetOtp", otp);
                session.setAttribute("resetExpireTime", System.currentTimeMillis() + 60000);

                EmailUtil.sendEmail(email, "Mã OTP Khôi Phục Mật Khẩu", "Mã OTP của bạn: <b>" + otp + "</b>");
                resp.sendRedirect(req.getContextPath() + "/reset-password");
            } else {
                req.setAttribute("error", "Email không tồn tại trong hệ thống!");
                // Thay forward -> include
                req.getRequestDispatcher("/views/common/forgot-password.jsp").include(req, resp);
            }

        } else if ("/reset-password".equals(path)) {
            String inputOtp = req.getParameter("otp");
            String newPassword = req.getParameter("newPassword");

            HttpSession session = req.getSession();
            String email = (String) session.getAttribute("resetEmail");
            String resetOtp = (String) session.getAttribute("resetOtp");
            Long expireTime = (Long) session.getAttribute("resetExpireTime");

            if (expireTime != null && System.currentTimeMillis() > expireTime) {
                req.setAttribute("error", "Mã OTP đã hết hạn! Vui lòng gửi lại yêu cầu.");
                // Thay forward -> include
                req.getRequestDispatcher("/views/common/reset-password.jsp").include(req, resp);
                return;
            }

            if (email != null && resetOtp != null && resetOtp.equals(inputOtp)) {
                User user = userService.findByEmail(email);
                if (user != null) {
                    user.setPassword(newPassword);
                    user.setCode(null);
                    userService.update(user);

                    session.removeAttribute("resetEmail");
                    session.removeAttribute("resetOtp");
                    session.removeAttribute("resetExpireTime");

                    req.setAttribute("message", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
                    // Thay forward -> include
                    req.getRequestDispatcher("/views/common/login.jsp").include(req, resp);
                    return;
                }
            }

            req.setAttribute("error", "Mã OTP không đúng!");
            // Thay forward -> include
            req.getRequestDispatcher("/views/common/reset-password.jsp").include(req, resp);
        }
    }
}