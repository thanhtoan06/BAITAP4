package hcmute.vn.services;

import hcmute.vn.entities.Product;
import java.util.List;

public interface IProductService {
    List<Product> findAll();
    List<Product> search(String keyword, int cateId);
    List<Product> searchByName(String keyword);
    Product findById(int id);
    void insert(Product product);
    void update(Product product);
    void delete(int id);

    List<Product> getTop10News();
    List<Product> getProductsPaging(int page, int pageSize);
    int countTotalProducts();
    List<Product> getProductsPagingByCategoryId(int categoryId, int page, int pageSize);
    int countTotalProductsByCategoryId(int categoryId);
}