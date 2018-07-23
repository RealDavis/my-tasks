package br.com.myTasks.models.services;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import br.com.myTasks.exceptions.UserExistenceExcepion;
import br.com.myTasks.interfaces.IUserRepository;
import br.com.myTasks.interfaces.IUserService;
import br.com.myTasks.models.entityes.User;

@RequestScoped
public class UserService implements IUserService{

	private IUserRepository userRepository;
	
	@Deprecated
	public UserService() {
		this(null);
	}
	
	@Inject
	public UserService(IUserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public void createUser(User user) throws UserExistenceExcepion {
		if(userRepository.userExist(user)) {
			throw new UserExistenceExcepion("Usuário inválido, escolha outro endereço de email");
		}
		
		userRepository.insert(user);
	}
	
}
