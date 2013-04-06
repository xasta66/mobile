package springapp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import springapp.domain.Page;
import springapp.domain.User;
import springapp.repository.UserDao;

@Component
public class UserSimpleManager implements UserManager {

    private static final long serialVersionUID = 1L;

 //   @Autowired
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	public User getUserById(int id) {
	    return userDao.getUserById(id);
	}
    
    public List<User> getUsersList() {
        // return users;
        return userDao.getUsersList();
    }

	public void updateUser(User user) {
	     userDao.updateUser(user);
		
	}

	public void newUser(User user) {
	     userDao.newUser(user);
		
	}

	public void deleteUserById(int id) {
	     userDao.deleteUserById(id);
		
	}

	public Page<User> getUsersPage( int pageNo,  int pageSize, String search){
		return userDao.getUsersPage( pageNo,  pageSize, search);
	}

}