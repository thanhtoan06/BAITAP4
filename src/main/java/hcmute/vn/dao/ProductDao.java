package hcmute.vn.dao;

import hcmute.vn.entities.Product;
import hcmute.vn.utils.JpaConfig;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class ProductDao implements IProductDao {

    @Override
    public List<Product> findAll() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            TypedQuery<Product> query = enma.createQuery("SELECT p FROM Product p", Product.class);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> search(String keyword, int cateId) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.productName LIKE :keyword AND p.category.cateId = :cateId";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setParameter("keyword", "%" + keyword + "%");
            query.setParameter("cateId", cateId);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> searchByName(String keyword) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.productName LIKE :keyword";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setParameter("keyword", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public Product findById(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            return enma.find(Product.class, id);
        } finally {
            enma.close();
        }
    }

    @Override
    public void insert(Product product) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(product);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void update(Product product) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.merge(product);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void delete(int id) {
        EntityManager enma = JpaConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            Product product = enma.find(Product.class, id);
            if (product != null) {
                enma.remove(product);
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }
    
    @Override
    public List<Product> getTop10News() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.id DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setMaxResults(10);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public List<Product> getProductsPaging(int page, int pageSize) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p ORDER BY p.id DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public int countTotalProducts() {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(p) FROM Product p";
            TypedQuery<Long> query = enma.createQuery(jpql, Long.class);
            return query.getSingleResult().intValue();
        } finally {
            enma.close();
        }
    }
    
    @Override
    public List<Product> getProductsPagingByCategoryId(int categoryId, int page, int pageSize) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT p FROM Product p WHERE p.category.cateId = :cateId ORDER BY p.id DESC";
            TypedQuery<Product> query = enma.createQuery(jpql, Product.class);
            query.setParameter("cateId", categoryId);
            query.setFirstResult((page - 1) * pageSize);
            query.setMaxResults(pageSize);
            return query.getResultList();
        } finally {
            enma.close();
        }
    }

    @Override
    public int countTotalProductsByCategoryId(int categoryId) {
        EntityManager enma = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(p) FROM Product p WHERE p.category.cateId = :cateId";
            Query query = enma.createQuery(jpql);
            query.setParameter("cateId", categoryId);
            return ((Long) query.getSingleResult()).intValue();
        } finally {
            enma.close();
        }
    }
}