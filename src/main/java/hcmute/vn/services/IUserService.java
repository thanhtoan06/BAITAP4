package hcmute.vn.services;

import hcmute.vn.entities.User;
import java.util.List;

public interface IUserService {
    void insert(User user);
    void update(User user);
    void delete(int id);
    User findById(int id);
    User findByUsername(String username);
    User findByEmail(String email);
    User findByCode(String code);
    User login(String username, String password);
    List<User> findAll();
    boolean checkExistUsername(String username);
    boolean checkExistEmail(String email);
}