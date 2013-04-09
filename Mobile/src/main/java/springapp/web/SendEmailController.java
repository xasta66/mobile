package springapp.web;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller
@RequestMapping("/sendEmail.htm")
public class SendEmailController {
 
    @Autowired
    private JavaMailSender mailSender;
     
        
    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody void doSendEmail(HttpServletResponse response,
    		@RequestParam(value = "mailAddressModal", required = true) String mailAddress,
    		@RequestParam(value = "subject", required = true) String subject,
    		@RequestParam(value = "message", required = true) String message) throws Exception {
                  
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(mailAddress);
        email.setSubject(subject);
        email.setText(message);

        response.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html");  
        
//        response.getWriter().write("succes"); //Esborrar!!!!!!!!!!!
                         
        try {
			// sends the e-mail
			mailSender.send(email);
			//response= returnCode-message!!!
	        response.getWriter().write("success-missatge enviat"); 
		} catch (MailException e) {
	        response.getWriter().write("error-" + e.getMessage()); 
		} catch (NullPointerException npe){
			response.getWriter().write("error-servidor de correu no disponible");
		}
		

    }
}
