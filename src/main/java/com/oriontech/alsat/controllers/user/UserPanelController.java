package com.oriontech.alsat.controllers.user;

import com.oriontech.alsat.models.Account;
import com.oriontech.alsat.services.AccountService;
import com.oriontech.alsat.services.AdvertService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/panel")
public class UserPanelController {

	@Autowired
	AccountService accountService;
	@Autowired
	AdvertService advertService;	
	

	@GetMapping()
	public String index(Authentication authentication,ModelMap model) {
		model.put("adverts_length", advertService.userAdverts(authentication.getName()).size());
		


		return "user.panel.ozet";
	}

}
