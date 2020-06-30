package com.oriontech.alsat.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.oriontech.alsat.models.Account;

@Repository
public interface AccountRepository extends CrudRepository<Account, Long>{
	public Optional<Account> findByUsername(String username);
	public Optional<Account> findByMail(String mail);
	public Optional<Account> findById(Long id);
	boolean existsByUsername(String username);
	boolean existsByMail(String mail);
	
	

}
