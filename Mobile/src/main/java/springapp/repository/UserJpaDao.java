package springapp.repository;


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import springapp.domain.User;

@Repository(value = "userDao")
public class UserJpaDao  implements UserDao {

 private EntityManager em = null;

    /*
     * Sets the entity manager.
     */
    @PersistenceContext
    public void setEntityManager(EntityManager em) {
        this.em = em;
    }

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public List<User> getUserList() {
    	return em.createQuery( "from " + User.class.getName() ).getResultList();
	}

    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
	public User getUser(int id) {
		return em.find( User.class, id );
	}

    @Transactional(readOnly = false)
	public void updateUser(User user) {
        em.merge(user);
	}

    @Transactional(readOnly = false)
	public void newUser(User user) {
	      em.persist(user);		
	}

    @Transactional(readOnly = false)
	public void deleteUser(User user) {
        user = em.merge(user);
        em.remove(user);
		
	}

}