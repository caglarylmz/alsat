package com.oriontech.alsat.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.RoleService;

@Controller
@RequestMapping("/user/account")
public class UserAccountController {
	@Autowired
	AccountService accountService;


	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}

	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication, ModelMap accountModel) {
		accountModel.put("account", accountService.findByUsername(authentication.getName()));
		return "user.account.profile";
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@ModelAttribute("account") Account account) {
		Account currentAccount = accountService.findById(account.getId());
		if (!account.getPassword().isEmpty())
			currentAccount.setPassword(passwordEncoder().encode(account.getPassword()));
		currentAccount.setUsername(account.getUsername());
		currentAccount.setMail(account.getMail());
		currentAccount.setFullName(account.getFullName());
		currentAccount.setAdressDetail(account.getAdressDetail());
		currentAccount.setTown(account.getTown());
		currentAccount.setCity(account.getCity());
		currentAccount.setPhone(account.getPhone());
		

		accountService.save(currentAccount);
		return "redirect:/user/account/profile";
	}
}
