package hcmute.vn.controllers.catalog.common;

import hcmute.vn.entities.User;
import hcmute.vn.services.IUserService;
import hcmute.vn.services.UserServiceImpl;
import hcmute.vn.utils.EmailUtil;
import java.io.IOException;
import java.util.Date;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/common/register.jsp").include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String fullname = req.getParameter("fullname");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");

        if (userService.checkExistUsername(username)) {
            req.setAttribute("error", "Tên đăng nhập đã tồn tại!");
            req.getRequestDispatcher("/views/common/register.jsp").include(req, resp);
            return;
        }

        if (userService.checkExistEmail(email)) {
            req.setAttribute("error", "Email đã tồn tại!");
            req.getRequestDispatcher("/views/common/register.jsp").include(req, resp);
            return;
        }

        String otp = String.format("%06d", new Random().nextInt(900000) + 100000);

        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setFullname(fullname);
        user.setPassword(password);
        user.setPhone(phone);
        user.setCreateddate(new Date());
        user.setAvatar("admin.png");
        user.setRoleId(1);
        user.setStatus(1);

        HttpSession session = req.getSession();
        session.setAttribute("tempUser", user);
        session.setAttribute("otpCode", otp);
        session.setAttribute("otpExpireTime", System.currentTimeMillis() + 60000);

        String subject = "Mã xác thực OTP Đăng ký tài khoản Admin";
        String body = "<h3>Mã OTP xác thực tài khoản của bạn là: <b style='color:red;'>" + otp + "</b></h3>";
        EmailUtil.sendEmail(email, subject, body);

        resp.sendRedirect(req.getContextPath() + "/verify-otp");
    }
}