package springapp.web;

import java.util.Collection;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import springapp.domain.User;
import springapp.service.UserManager;


@Controller
public class UserController {
	
    protected final Log logger = LogFactory.getLog(getClass());
    
   @Autowired
    private UserManager userManager;

	@RequestMapping("/userList.htm")	
	@ModelAttribute("users")
	public Collection<User> getUsers() {
		
		return  this.userManager.getUsers();

	}

	@RequestMapping("/userDetails.htm")
	public User getUser(@RequestParam(value = "id", required = true) int id) {
		
		return this.userManager.getUser(id);
	}
	
    public void setUsertManager(UserManager userManager) {
        this.userManager = userManager;
    }
		
}

