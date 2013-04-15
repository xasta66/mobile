package springapp.repository;

import java.util.List;

import springapp.domain.Page;
import springapp.domain.User;

public interface UserDao {

    public List<User> getUsersList();
    
    public Page<User> getUsersPage(final int pageNo, final int pageSize, String search);
    
    public User getUserById(int id);
    
    public List<String> getListMailAddresses(String query);
    
    public User getUserByCode(String code);

    public void updateUser(User user);
    
    public void newUser(User user);
    
    public void deleteUserById(int id);

}