package hcmute.vn.services;

import hcmute.vn.dao.IUserDao;
import hcmute.vn.dao.UserDao;
import hcmute.vn.entities.User;
import java.util.List;

public class UserServiceImpl implements IUserService {
    private IUserDao userDao = new UserDao();

    @Override
    public void insert(User user) { userDao.insert(user); }

    @Override
    public void update(User user) { userDao.update(user); }

    @Override
    public void delete(int id) { userDao.delete(id); }

    @Override
    public User findById(int id) { return userDao.findById(id); }

    @Override
    public User findByUsername(String username) { return userDao.findByUsername(username); }

    @Override
    public User findByEmail(String email) { return userDao.findByEmail(email); }

    @Override
    public User findByCode(String code) { return userDao.findByCode(code); }

    @Override
    public User login(String username, String password) { return userDao.login(username, password); }

    @Override
    public List<User> findAll() { return userDao.findAll(); }

    @Override
    public boolean checkExistUsername(String username) { return userDao.checkExistUsername(username); }

    @Override
    public boolean checkExistEmail(String email) { return userDao.checkExistEmail(email); }
}