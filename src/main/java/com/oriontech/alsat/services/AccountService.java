package com.oriontech.alsat.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.repositories.AccountRepository;

@Service
public class AccountService implements UserDetailsService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = (Account) accountRepository.findByUsername(username).get();

		if (account == null)
			throw new UsernameNotFoundException("Kullanıcı adı bulunamadı " + username);

		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole().getName()));

		return new User(account.getUsername(), account.getPassword(), grantedAuthorities);
	}

	public UserDetails loadUserByEmail(String email) throws UsernameNotFoundException {
		Account account = (Account) accountRepository.findByEmail(email).get();

		if (account == null)
			throw new UsernameNotFoundException("Mail not found for " + email);

		List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
		grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole().getName()));

		return new User(account.getEmail(), account.getPassword(), grantedAuthorities);
	}

	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username).get();

	}

	public Account findById(Long id) {
		return accountRepository.findById(id).get();

	}
	
	public Iterable<Account> findAll(){
		return accountRepository.findAll();
	}

	public Account save(Account account) {
		return accountRepository.save(account);
	}
	
	public boolean existByUsername(String username)  {
		return accountRepository.existsByUsername(username);
	}
	public boolean existByEmail(String email) {
		return accountRepository.existsByEmail(email);
	}
	
	public void deleteById(Long id) {
		accountRepository.deleteById(id);
	}
	
}
