package hcmute.vn.controllers.catalog.admin;

import hcmute.vn.entities.Category;
import hcmute.vn.entities.Product;
import hcmute.vn.services.CategoryServiceImpl;
import hcmute.vn.services.ICategoryService;
import hcmute.vn.services.IProductService;
import hcmute.vn.services.ProductServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(urlPatterns = {
    "/product",               
    "/admin/product",         
    "/admin/product/add",
    "/admin/product/edit",
    "/admin/product/delete"
})
public class AdminProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private IProductService productService = new ProductServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();

        if (path.equals("/admin/product/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            productService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/product");
            return;
        }

        if (path.equals("/admin/product/add")) {
            List<Category> categories = categoryService.findAll();
            req.setAttribute("categories", categories);
            // Đổi forward -> include
            req.getRequestDispatcher("/views/catalog/admin/product-add.jsp").include(req, resp);
            return;
        }

        if (path.equals("/admin/product/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            List<Category> categories = categoryService.findAll();

            req.setAttribute("product", product);
            req.setAttribute("categories", categories);
            // Đổi forward -> include
            req.getRequestDispatcher("/views/catalog/admin/product-edit.jsp").include(req, resp);
            return;
        }

        int page = 1;
        int pageSize = 6;
        if (req.getParameter("page") != null) {
            try {
                page = Integer.parseInt(req.getParameter("page"));
            } catch (Exception e) {
                page = 1;
            }
        }

        String categoryIdStr = req.getParameter("categoryId");
        List<Product> list;
        int totalProducts;

        if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryIdStr);
                list = productService.getProductsPagingByCategoryId(categoryId, page, pageSize);
                totalProducts = productService.countTotalProductsByCategoryId(categoryId);
            } catch (Exception e) {
                list = productService.getProductsPaging(page, pageSize);
                totalProducts = productService.countTotalProducts();
            }
        } else {
            list = productService.getProductsPaging(page, pageSize);
            totalProducts = productService.countTotalProducts();
        }

        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);

        List<Category> categories = categoryService.findAll();

        req.setAttribute("categories", categories);
        req.setAttribute("productList", list);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        // Đổi forward -> include
        req.getRequestDispatcher("/views/catalog/admin/product-list.jsp").include(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        String productName = req.getParameter("productName");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Part filePart = req.getPart("image");

        Category category = categoryService.findById(categoryId);

        if (path.equals("/admin/product/add")) {
            Product product = new Product();
            product.setProductName(productName);
            product.setPrice(price);
            product.setDescription(description);
            product.setCategory(category);

            String imageName = handleFileUpload(req, filePart, "default-product.png");
            product.setImage(imageName);

            productService.insert(product);
            resp.sendRedirect(req.getContextPath() + "/product");

        } else if (path.equals("/admin/product/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);

            if (product != null) {
                product.setProductName(productName);
                product.setPrice(price);
                product.setDescription(description);
                product.setCategory(category);

                String imageName = handleFileUpload(req, filePart, product.getImage());
                product.setImage(imageName);

                productService.update(product);
            }
            resp.sendRedirect(req.getContextPath() + "/product");
        }
    }

    private String handleFileUpload(HttpServletRequest req, Part filePart, String defaultName) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String rawFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileName = System.currentTimeMillis() + "_" + rawFileName;

            String contextRealPath = req.getServletContext().getRealPath("");
            String uploadPath = req.getServletContext().getRealPath("/uploads");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            File serverFile = new File(uploadDir, fileName);
            filePart.write(serverFile.getAbsolutePath());

            try {
                if (contextRealPath != null && contextRealPath.contains(".metadata")) {
                    File deployedFolder = new File(contextRealPath);
                    String projectName = deployedFolder.getName();
                    String workspacePath = contextRealPath.substring(0, contextRealPath.indexOf(".metadata"));

                    String projectSourcePath = workspacePath + projectName + File.separator 
                                             + "src" + File.separator + "main" + File.separator 
                                             + "webapp" + File.separator + "uploads";

                    File srcDir = new File(projectSourcePath);
                    if (!srcDir.exists()) srcDir.mkdirs();

                    File srcFile = new File(srcDir, fileName);
                    Files.copy(serverFile.toPath(), srcFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return fileName;
        }
        return defaultName;
    }
}