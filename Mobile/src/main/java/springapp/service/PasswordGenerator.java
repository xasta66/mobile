package springapp.service;

import java.util.Random;

public class PasswordGenerator {
	
	public String generatePassword() {
		String str = new String(
				"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*_=+-/");
		
		StringBuffer sb = new StringBuffer();

		Random rand = new Random();
		
		int te = 0;
		
		for (int i = 1; i <= 8; i++) {
			te = rand.nextInt(75);
			sb.append(str.charAt(te));
		}
		
		return sb.toString();
	
		
	}
	
}