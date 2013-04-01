package springapp.service;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;

import org.apache.log4j.Logger;

import springapp.domain.User;

public class UserModifyValidator implements Validator {

    /** Logger for this class and subclasses */
    private  final Logger logger = Logger.getLogger(getClass());

    public boolean supports(Class clazz) {
        return User.class.equals(clazz);
    }

    public void validate(Object obj, Errors errors) {
        User user = (User) obj;
        if (user.getCode().equals("") ) {
            errors.rejectValue("code", "error.code.not-specified", null, "Value required.");
        }
        else {
            logger.info("Validating with " + user + ": " + user.getName());
            if (user.getName() .equals("")) {
            	errors.rejectValue("name", "error.name.not-specified", null, "Value required.");
            }
        }
    }

}