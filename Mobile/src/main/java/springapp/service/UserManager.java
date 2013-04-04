package springapp.service;

import java.io.Serializable;
import java.util.List;

import springapp.domain.User;

public interface UserManager extends Serializable{
    
    public List<User> getUsersList();
    
    public User getUserById(int id);
    
    public void updateUser(User user);
    
    public void newUser(User user);
    
    public void deleteUserById(int id);
    
}