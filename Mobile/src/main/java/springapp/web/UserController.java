package springapp.web;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import springapp.domain.Page;
import springapp.domain.User;
import springapp.service.UserManager;


@Controller
public class UserController {
	
    protected final Log logger = LogFactory.getLog(getClass());
    
   @Autowired
    private UserManager userManager;
/*
	@RequestMapping("/userList.htm")	
	@ModelAttribute("users")
	public Collection<User> getUsers() {
		
		return  userManager.getUsersList();

	}
*/
	
	@RequestMapping("/userList.htm")
	public ModelAndView  getUsers(
			@RequestParam(value = "pageNo", required = false) Integer pageNo,
			@RequestParam(value = "search", required = false) String search) {

		//Hardcode for the number of users to show for page
		int pageSize = 11;
		
		// If page number and search are null or seach, init page to page 1
		if(pageNo == null && search == null){
			pageNo = 1;
			search = "";
		}
			
		Page<User> usersPage =  userManager.getUsersPage(pageNo, pageSize, search);
		
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("pagesAvailable", usersPage.getPagesAvailable());
        model.put("pageNumber", usersPage.getPageNumber());
        model.put("pageSize", pageSize);        
        model.put("users", usersPage.getPageItems());
        model.put("search", search);
		
        return new ModelAndView("userList", "model", model);

	}
	
	
	@RequestMapping("/userDetail.htm")
	public ModelAndView getUser(
			@RequestParam(value = "id", required = true) int id, 
			@RequestParam(value = "pageNo", required = false) int pageNo) {
		
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("pageNumber", pageNo);      
        model.put("user", userManager.getUserById(id));
		
        return new ModelAndView("userDetail", "model", model);
	}
	
	@RequestMapping("/deleteUser.htm")
	public String getDeleteUser(@RequestParam(value = "id", required = true) int id) {
		
		userManager.deleteUserById(id);
		
		return "redirect:userList.htm";
	}
	
}

