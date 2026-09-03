package hcmute.vn.controllers.catalog.admin;

import hcmute.vn.entities.Product;
import hcmute.vn.services.CategoryServiceImpl;
import hcmute.vn.services.ICategoryService;
import hcmute.vn.services.IProductService;
import hcmute.vn.services.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ICategoryService cateService = new CategoryServiceImpl();
    private IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int countCategories = cateService.findAll().size();
        int countProducts = productService.countTotalProducts();

        List<Product> top10Products = productService.getTop10News();

        req.setAttribute("countCategories", countCategories);
        req.setAttribute("countProducts", countProducts);
        req.setAttribute("top10Products", top10Products);

        // Đổi forward thành include để tương thích với SiteMesh 3 trên Tomcat 11
        req.getRequestDispatcher("/views/catalog/admin/dashboard.jsp").include(req, resp);
    }
}