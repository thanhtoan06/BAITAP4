package hcmute.vn.dao;

import hcmute.vn.entities.User;
import hcmute.vn.utils.JpaConfig;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class UserDao implements IUserDao {
    @Override
    public void insert(User user) {
        EntityManager en = JpaConfig.getEntityManager();
        EntityTransaction trans = en.getTransaction();
        try {
            trans.begin();
            en.persist(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
        } finally {
            en.close();
        }
    }

    @Override
    public void update(User user) {
        EntityManager en = JpaConfig.getEntityManager();
        EntityTransaction trans = en.getTransaction();
        try {
            trans.begin();
            en.merge(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
        } finally {
            en.close();
        }
    }

    @Override
    public void delete(int id) {
        EntityManager en = JpaConfig.getEntityManager();
        EntityTransaction trans = en.getTransaction();
        try {
            trans.begin();
            User user = en.find(User.class, id);
            if (user != null) en.remove(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
        } finally {
            en.close();
        }
    }

    @Override
    public User findById(int id) {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            return en.find(User.class, id);
        } finally {
            en.close();
        }
    }

    @Override
    public User findByUsername(String username) {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.username = :username";
            TypedQuery<User> query = en.createQuery(jpql, User.class);
            query.setParameter("username", username);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            en.close();
        }
    }

    @Override
    public User findByEmail(String email) {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            TypedQuery<User> query = en.createQuery(jpql, User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            en.close();
        }
    }

    @Override
    public User findByCode(String code) {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.code = :code";
            TypedQuery<User> query = en.createQuery(jpql, User.class);
            query.setParameter("code", code);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            en.close();
        }
    }

    @Override
    public List<User> findAll() {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            TypedQuery<User> query = en.createQuery("SELECT u FROM User u", User.class);
            return query.getResultList();
        } finally {
            en.close();
        }
    }

    @Override
    public boolean checkExistUsername(String username) {
        return findByUsername(username) != null;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return findByEmail(email) != null;
    }
    
    @Override
    public User login(String username, String password) {
        EntityManager en = JpaConfig.getEntityManager();
        try {
            String jpql = "SELECT u FROM User u WHERE u.username = :username AND u.password = :password";
            TypedQuery<User> query = en.createQuery(jpql, User.class);
            query.setParameter("username", username);
            query.setParameter("password", password);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            en.close();
        }
    }
}