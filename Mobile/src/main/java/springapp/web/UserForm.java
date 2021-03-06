package springapp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springapp.service.PasswordGenerator;
import springapp.service.UserManager;
import springapp.service.UserValidator;
import springapp.domain.User;

@Controller
@RequestMapping("/userForm.htm")
@SessionAttributes("user")
public class UserForm  {
	
   @Autowired
    private UserManager userManager;
   
   @Autowired
   private UserValidator userValidator;
	
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		dataBinder.setDisallowedFields(new String[] { "id" });
		dataBinder.setRequiredFields(new String[] { "code", "name","surname_1","surname_2","mail","password" });
		dataBinder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
/*
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		dateFormat.setLenient(false);
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
*/		
	}

	@RequestMapping(method = RequestMethod.GET)
//	@ModelAttribute("user")
	public User setUpForm(@RequestParam(value = "id", required = false) Integer id) {
		if (id == null) {
						
			return new User();
			
		} else {
			return userManager.getUserById(id.intValue());
		}
	}

	@RequestMapping(params = "create", method = RequestMethod.POST)
	public String create(User user, BindingResult result, SessionStatus status) {
		
		
		userValidator.validate(user, result);
		
		if (result.hasErrors()) {
			return "userForm";
		} else {
			userManager.newUser(user);
			status.setComplete();
			return "redirect:userList.htm";
		}
		
//		return update(user, result, status);
	}

	@RequestMapping(params = "update", method = RequestMethod.POST)
	public String update(User user, BindingResult result, SessionStatus status) {


		
		userValidator.validate(user, result);
				
		if (result.hasErrors()) {
			return "userForm";
		} else {
			userManager.updateUser(user);
			status.setComplete();
			return "redirect:userList.htm";
		}
	}
/*
	@RequestMapping(params = "delete", method = RequestMethod.POST)
	public String delete(User user, BindingResult result, SessionStatus status) {
		userManager.deleteUser(user);
		status.setComplete();
		return "redirect:userList.htm";
	}
*/
}
