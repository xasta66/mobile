package springapp.repository;

import java.util.List;

import springapp.domain.User;

public interface UserDao {

    public List<User> getUserList();
    
    public User getUser(int id);    

    public void updateUser(User user);
    
    public void newUser(User user);
    
    public void deleteUser(User user);

}