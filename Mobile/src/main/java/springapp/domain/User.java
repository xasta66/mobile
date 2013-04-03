package springapp.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users") 
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    
    private String code;
    private String name;
	private String surname_1;
    private String surname_2;
    private String mail;
	
    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    } 
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
    public String getSurname_1() {
		return surname_1;
	}

	public void setSurname_1(String surname_1) {
		this.surname_1 = surname_1;
	}

	public String getSurname_2() {
		return surname_2;
	}

	public void setSurname_2(String surname_2) {
		this.surname_2 = surname_2;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}	
    public String toString() {
        StringBuffer buffer = new StringBuffer();
        buffer.append("Code: " + code + ";");
        buffer.append("Name: " + name + ";");
        buffer.append("Surname_1: " + surname_1 + ";");        
        buffer.append("Surname_2: " + surname_2 + ";");
        buffer.append("Mail: " + mail);
        return buffer.toString();
    }
}