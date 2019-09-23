package services;

import domain.Researcher;

public class LoginService {

	public static final long RESEARCHER_ID_MOCK = 1L;
	public static final String RESEARCHER_NAME_MOCK = "Ivan";

	public Researcher makeLogin(String name, String password) {
//		TODO: ir no banco buscar usuario
		
//		mock
		Researcher loggedResearcher = null;
		if(name.equals("Ivan") && !password.equals("")){
			loggedResearcher = new Researcher();
			loggedResearcher.setId(RESEARCHER_ID_MOCK);
			loggedResearcher.setName(RESEARCHER_NAME_MOCK);
		}
		
		return loggedResearcher;		
	}
	
	public Boolean checkResearcherExists(Long researcherId){
//		TODO: ir no banco
		return researcherId.equals(RESEARCHER_ID_MOCK);
	}
}
