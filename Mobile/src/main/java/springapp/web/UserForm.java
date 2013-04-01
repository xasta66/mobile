package springapp.web;

import java.text.SimpleDateFormat;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import springapp.repository.UserDao;
import springapp.service.UserManager;
import springapp.service.UserModifyValidator;
import springapp.domain.User;

@Controller
@RequestMapping("/userForm.htm")
@SessionAttributes("user")
public class UserForm  {
	
   @Autowired
    private UserManager userManager;
	
	private UserModifyValidator userModifyValidator = new UserModifyValidator();

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {

		dataBinder.setDisallowedFields(new String[] { "id" });
		dataBinder.setRequiredFields(new String[] { "code", "name" });
		dataBinder.registerCustomEditor(String.class, new StringTrimmerEditor(false));
/*
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		dateFormat.setLenient(false);
		dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
*/		
	}

	@RequestMapping(method = RequestMethod.GET)
	@ModelAttribute("user")
	public User setUpForm(@RequestParam(value = "id", required = false) Integer id) {
		if (id == null) {
			return new User();
		} else {
			return userManager.getUser(id.intValue());
		}
	}

	@RequestMapping(params = "create", method = RequestMethod.POST)
	public String create(User User, BindingResult result, SessionStatus status) {
		return update(User, result, status);
	}

	@RequestMapping(params = "update", method = RequestMethod.POST)
	public String update(User user, BindingResult result, SessionStatus status) {

		userModifyValidator.validate(user, result);
				
		if (result.hasErrors()) {
			return "userForm";
		} else {
			userManager.updateUser(user);
			status.setComplete();
			return "redirect:userList.htm";
		}
	}

	@RequestMapping(params = "delete", method = RequestMethod.POST)
	public String delete(User user, BindingResult result, SessionStatus status) {
		userManager.deleteUser(user);
		status.setComplete();
		return "redirect:userList.htm";
	}

}
