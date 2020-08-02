package com.oriontech.alsat.controllers.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.services.AccountService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("api/accounts")
@CrossOrigin(origins = "*")
public class RestAccountController {
	@Autowired
	private AccountService accountService;

	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	@GetMapping("/{username}")
	public Account getAccountByUsernae(@PathVariable String username) {
		return accountService.findByUsername(username);
	}

	@GetMapping("/{id}")
	public Account getAccountById(@PathVariable long id) {
		return accountService.findById(id);
	}

	@GetMapping()
	public List<Account> getAccounts() {
		return (List<Account>) accountService.findAll();
	}

	@PostMapping()
	public Account postMethodName(@RequestBody Account account) {
		return accountService.save(account);
	}

	@PutMapping()
	public Account updateAccount(@RequestBody Account account) {
		Account currentAccount = accountService.findById(account.getId());
		if (!account.getPassword().isEmpty())
			currentAccount.setPassword(passwordEncoder().encode(account.getPassword()));
		currentAccount.setUsername(account.getUsername());
		currentAccount.setEmail(account.getEmail());
		currentAccount.setFullName(account.getFullName());
		currentAccount.setAdressDetail(account.getAdressDetail());
		currentAccount.setTown(account.getTown());
		currentAccount.setCity(account.getCity());
		currentAccount.setPhone(account.getPhone());
		currentAccount.setRole(account.getRole());

		return accountService.save(currentAccount);
	}


}
