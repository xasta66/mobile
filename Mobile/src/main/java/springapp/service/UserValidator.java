package springapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

import org.apache.log4j.Logger;

import springapp.domain.User;

@Component
public class UserValidator implements Validator {

    /** Logger for this class and subclasses */
    private  final Logger logger = Logger.getLogger(getClass());
    
    @Autowired
    private UserManager userManager;    

    public boolean supports(Class clazz) {
        return User.class.equals(clazz);
    }

    public void validate(Object obj, Errors errors) {
        
    	User user = (User) obj;
    	
    	String code = user.getCode();
    	
    	User userExist = userManager.getUserByCode(code);
        
        if (userExist.getId() != null  && user.getId() != userExist.getId()) {
            errors.rejectValue("code", "error.code.already-exist", null, "Code already exist.");
        }
    }

}