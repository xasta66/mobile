package springapp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import springapp.domain.User;
import springapp.repository.UserDao;

@Component
public class UserSimpleManager implements UserManager {

    private static final long serialVersionUID = 1L;

    @Autowired
    private UserDao userDao;

    public List<User> getProducts() {
        return userDao.getUserList();
    }

	public User getUser(int id) {
	    return userDao.getUser(id);
	}
    
    public List<User> getUsers() {
        // return users;
        return userDao.getUserList();
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	public void updateUser(User user) {
	     userDao.updateUser(user);
		
	}

	public void newUser(User user) {
	     userDao.newUser(user);
		
	}

	public void deleteUser(User user) {
	     userDao.deleteUser(user);
		
	}
}