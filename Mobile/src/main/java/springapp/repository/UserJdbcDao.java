package springapp.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.StringTokenizer;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.stereotype.Component;

import springapp.domain.Page;
import springapp.domain.User;

@Component
public class UserJdbcDao implements UserDao {

@Autowired
private JdbcTemplate jdbcTemplate;

public void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new JdbcTemplate(dataSource);
}
  
public List<User> getUsersList() {
	
    return jdbcTemplate.query("select * from users", new UserMapper());
}

public User getUserById(int id) {
	
    return jdbcTemplate
        .queryForObject("select * from users where id = ? ",
            new Object[] { id },
            new UserMapper());
}

public User getUserByCode(String code) {
	
    return jdbcTemplate
        .queryForObject("select * from users where code = ? ",
            new Object[] { code },
            new UserMapper());
}

public List<String> getListMailAddresses(String search) {
	
	String whereClause = this.whereSearchByName(search);
	
	String query = "select concat(name,' ', surname_1,' ' ,surname_2,' <',mail,'>') as nameComp from users " + whereClause + " group by mail";

	return (List<String>) jdbcTemplate.queryForList(query, String.class);

}

public void updateUser(User user) {
		

	jdbcTemplate.update("update users set name = ?, code = ?, surname_1 = ?, surname_2 = ?, mail = ?, password = ? where id = ?",
	        new Object[] { user.getName(), user.getCode(), user.getSurname_1(), user.getSurname_2(), user.getMail(), user.getPassword(), user.getId() });
		
}

public void newUser(User user) {
	
	jdbcTemplate.update("insert into users (name, code, surname_1,surname_2, mail,password) VALUES(?,?,?,?,?,?)",
        new Object[] {user.getName(), user.getCode(), user.getSurname_1(), user.getSurname_2(), user.getMail(), user.getPassword() });
	
}

public void deleteUserById(int id) {

	jdbcTemplate.update("delete from users where id= ?",
        new Object[] {id });
}


public Page<User> getUsersPage(final int pageNo, final int pageSize, String search) {
	
	String whereClause = this.whereSearchByName(search);
		
	PaginationHelper<User> pagHelper = new PaginationHelper<User>();

    return pagHelper.fetchPage(
            jdbcTemplate,
            "SELECT count(*) FROM users " + whereClause + " ORDER BY id",
            "SELECT * FROM users " + whereClause + " ORDER BY id",
            new Object[]{},
            pageNo,
            pageSize,
            new UserMapper());
    
}

public String whereSearchByName(String search){
	
	String whereClause = "";
	
	if(search !=null &&  !search.trim().isEmpty()){
		
		StringTokenizer tokensSearch = new StringTokenizer(search);
		
	    whereClause = " where ";  
		int count = 0;
		while(tokensSearch.hasMoreElements()){
			
			if(count > 0){
				whereClause += " or ";	
			}
			
			String word = tokensSearch.nextToken();
			whereClause += "name like '" + word + "%'  or surname_1 like '" + word+ "%' or surname_2 like '" + word+ "%'";
			
			count++;
		}	
	}
	
	return whereClause;
}


private static class UserMapper implements ParameterizedRowMapper<User> {

    public User mapRow(ResultSet rs, int rowNum) throws SQLException {
    		User user = new User();
    		user.setId(rs.getInt("id"));
    		user.setName(rs.getString("name"));
    		user.setCode(rs.getString("code"));
    		user.setSurname_1(rs.getString("surname_1"));
    		user.setSurname_2(rs.getString("surname_2"));    		
    		user.setMail(rs.getString("mail"));    
    		user.setPassword(rs.getString("password"));     		
        return user;
    }
}
    
}



 