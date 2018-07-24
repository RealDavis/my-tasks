package br.com.myTasks.interfaces;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import br.com.myTasks.exceptions.UserExistenceExcepion;
import br.com.myTasks.models.entityes.User;

public interface IUserService {

	void createUser(User user) throws UserExistenceExcepion, NoSuchAlgorithmException, UnsupportedEncodingException ;
	
}
