package services;

import domain.User;

public class LoginService {

	public static final long USER_ID_MOCK = 1L;
	public static final String USER_NAME_MOCK = "Ivan";

	public User makeLogin(String name, String password) {
//		TODO: ir no banco buscar usuario
		
//		mock
		User loggedUser = null;
		if(name.equals("Ivan") && !password.equals("")){
			loggedUser = new User();
			loggedUser.setId(USER_ID_MOCK);
			loggedUser.setName(USER_NAME_MOCK);
		}
		
		return loggedUser;		
	}
	
	public Boolean checkUserExists(Long userId){
//		TODO: ir no banco
		return userId.equals(USER_ID_MOCK);
	}
}
